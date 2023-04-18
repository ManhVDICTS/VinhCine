import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:vinhcine/ui/pages/forgot_password/forgot_password_page.dart';
import 'package:vinhcine/ui/pages/home/home_page.dart';
import 'package:vinhcine/ui/pages/sign_in/sign_in_page.dart';
import 'package:vinhcine/ui/pages/sign_up/sign_up_page.dart';
import 'package:vinhcine/ui/pages/splash/splash_cubit.dart';
import 'package:vinhcine/ui/pages/splash/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/auth_repository.dart';
import '../ui/pages/home/home_cubit.dart';
import '../ui/pages/sign_in/sign_in_cubit.dart';

Handler notHandler = new Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
      Scaffold(
        body: Center(
          child: Text('$params'),
        ),
  ),
);

/// Splash page
Handler splashHandler = new Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
      BlocProvider(
        create: (context) {
          final repository = RepositoryProvider.of<AuthRepository>(context);
          return SplashCubit(repository: repository);
        },
        child: SplashPage(),
      ),
);

///Auth
Handler signInHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return BlocProvider(
        create: (context) {
          final repository = RepositoryProvider.of<AuthRepository>(context);
          return SignInCubit(repository: repository);
        },
        child: SignInPage(),
      );
});

///Signup
Handler signUpHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return SignUpPage();
});

///Forgot password
Handler forgotPasswordHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return ForgotPasswordPage();
});

///Home
Handler homeHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return BlocProvider(
    create: (context) {
      return HomeCubit();
    },
    child: HomePage(),
  );
});
