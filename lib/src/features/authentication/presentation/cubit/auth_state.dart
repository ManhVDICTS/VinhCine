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

class FullNameInvalid extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class PhoneInvalid extends AuthState {
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

class RegisterLoading extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class RegisterSuccess extends AuthState {
  RegisterSuccess(this.registerModel);
  RegisterModel? registerModel;
  @override
  List<Object?> get props => [registerModel];
}

class RegisterFail extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class EmailInvalid extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ForgotPasswordLoading extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ForgotPasswordSuccess extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ForgotPasswordFail extends AuthState {
  ForgotPasswordFail({required this.message});
  String message;
  @override
  List<Object?> get props => [message];
}
