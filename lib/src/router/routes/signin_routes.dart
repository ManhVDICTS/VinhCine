part of '../router.dart';

final _signInRoutes = [
  AutoRoute(
      path: 'signin',
      page: SignInWrapperPageRoute.page,
      children: [..._registerRoutes, ..._forgotPasswordRoutes],
  )
];
