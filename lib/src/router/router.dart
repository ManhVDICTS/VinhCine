import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:vinhcine/src/features/home/home_screen.dart';
import 'routes/detail_routes.dart';
import 'routes/signin_routes.dart';

GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: <RouteBase>[...detailRoutes, ...signinRoutes]),
  ],
);
