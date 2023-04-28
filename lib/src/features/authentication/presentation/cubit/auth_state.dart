// ignore_for_file: must_be_immutable

part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class SignInInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class SignInLoading extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SignInFail extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SignInSuccess extends AuthState {
  SignInSuccess({required this.token});
  String token;
  @override
  List<Object?> get props => [token];
}

class GetTokenSuccess extends AuthState {
  GetTokenSuccess({required this.token});
  String token;
  @override
  List<Object?> get props => [token];
}

class UserNameInvalid extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class PasswordInvalid extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SignOutLoading extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SignOutSuccess extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SignOutFail extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
