import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:vinhcine/src/features/signin/presentation/views/signin_screen.dart';

final signinRoutes = [
  GoRoute(
    path: 'signIn',
    builder: (BuildContext context, GoRouterState state) {
      return SignInScreen();
    },
  ),
];
