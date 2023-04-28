part of 'signin_cubit.dart';

abstract class SignInState extends Equatable {
  const SignInState();
}

class SignInInitial extends SignInState {
  @override
  List<Object> get props => [];
}

class SignInLoading extends SignInState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SignInFail extends SignInState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SignInSuccess extends SignInState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class InitDataSuccess extends SignInState {
  InitDataSuccess({required this.token});
  String token;
  @override
  List<Object?> get props => [token];
}
