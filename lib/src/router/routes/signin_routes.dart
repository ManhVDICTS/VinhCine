part of '../router.dart';

final _signInRoutes = [
  AutoRoute(path: 'signin', page: SignInWrapperPageRoute.page),
  AutoRoute(path: 'register', page: RegisterWrapperPageRoute.page),
  AutoRoute(path: 'forgot_password', page: ForgotPasswordWrapperPageRoute.page),
];
