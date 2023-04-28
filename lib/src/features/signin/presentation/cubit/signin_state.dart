part of 'signin_cubit.dart';

// ignore: must_be_immutable
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
  SignInSuccess({required this.token});
  String token;
  @override
  List<Object?> get props => [token];
}

class InitDataSuccess extends SignInState {
  InitDataSuccess({required this.token});
  String token;
  @override
  List<Object?> get props => [token];
}

class UserNameInvalid extends SignInState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class PasswordInvalid extends SignInState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SignOutLoading extends SignInState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SignOutSuccess extends SignInState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SignOutFail extends SignInState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
