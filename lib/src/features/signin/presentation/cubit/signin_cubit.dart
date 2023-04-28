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
      di<SingInProviderImpl>().save(key: "access_token", data: data);
      emit(SignInSuccess());
    });
  }

  void initData() async{
    var token = await di<SingInProviderImpl>().fetch(key: 'access_token');
    if(token?.isNotEmpty == true) {
      emit(InitDataSuccess(token: token!));
    } else {
      emit(InitDataSuccess(token: ''));
    }
  }
}
