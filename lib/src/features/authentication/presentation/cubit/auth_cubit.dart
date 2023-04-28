import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vinhcine/src/core/shared_prefs/shared_prefs_provider.dart';
import 'package:vinhcine/src/features/authentication/domain/model/register.dart';
import '../../domain/repositories/auth_repository.dart';
import 'package:vinhcine/src/core/di/injections.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.repository) : super(SignInInitial());

  final SignInRepository repository;

  Future<void> signIn(String username, String password) async {
    emit(SignInLoading());
    final response = await repository.signIn(userName: username, password: password);
    response.fold((error) {
      emit(SignInFail());
    }, (data) {
      di<SharedPrefProvider>().save(key: kAccessTokenKey, data: data);
      emit(SignInSuccess(token: data));
    });
  }

  void initData() async{
    var token = await di<SharedPrefProvider>().fetch(key: kAccessTokenKey);
    emit(GetTokenSuccess(token: token ?? ''));
  }

  bool checkUserName(String userName){
    bool valid = userName.isNotEmpty;
    if(!valid) {
      emit(UserNameInvalid());
    }
    return valid;
  }

  bool checkPassword(String password){
    bool valid = password.isNotEmpty;
    if(!valid) {
      emit(PasswordInvalid());
    }
    return valid;
  }

  bool checkFullName(String fullName){
    bool valid = fullName.isNotEmpty;
    if(!valid) {
      emit(FullNameInvalid());
    }
    return valid;
  }

  bool checkPhone(String phone){
    bool valid = phone.isNotEmpty;
    if(!valid) {
      emit(PhoneInvalid());
    }
    return valid;
  }

  Future<void> signOut() async{
    emit(SignOutLoading());
    final response = await repository.signOut();
    response.fold((error) {
      emit(SignOutFail());
    }, (data) {
      di<SharedPrefProvider>().delete(key: kAccessTokenKey);
      emit(SignOutSuccess());
    });
  }

  Future<void> register({
    required String userName,
    required String password,
    required String fullName,
    required String phone,
  }) async{
    emit(RegisterLoading());
    final response = await repository.register(userName: userName, password: password, fullName: fullName, phone: phone);
    response.fold((error) {
      emit(RegisterFail());
    }, (data) {
      emit(RegisterSuccess(data));
    });
  }
}
