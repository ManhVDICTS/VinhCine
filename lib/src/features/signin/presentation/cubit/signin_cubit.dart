import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vinhcine/src/core/shared_prefs/shared_prefs_provider.dart';
import '../../domain/repositories/signin_repository.dart';
import 'package:vinhcine/src/core/di/injections.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.repository) : super(SignInInitial());

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
    if(token?.isNotEmpty == true) {
      emit(InitDataSuccess(token: token!));
    } else {
      emit(InitDataSuccess(token: ''));
    }
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
}
