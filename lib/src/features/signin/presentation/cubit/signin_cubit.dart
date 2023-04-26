import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/repositories/signin_repository.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.repository) : super(SignInInitial());

  final SignInRepository repository;

  Future<void> signIn(String username, String password) async {
    emit(SignInLoading());
    try {
      final result = await repository.signIn(userName: username, password: password);
      // await repository.saveToken(result);
      emit(SignInSuccess());
    } catch (error) {
      emit(SignInFail());
    }
  }
}
