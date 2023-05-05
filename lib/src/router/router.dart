import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/features/authentication/presentation/views/forgot_password_screen.dart';
import 'package:vinhcine/src/features/authentication/presentation/views/register_screen.dart';
import 'package:vinhcine/src/features/detail/presentation/cubit/detail_cubit.dart';
import 'package:vinhcine/src/features/detail/presentation/views/detail_screen.dart';
import 'package:vinhcine/src/features/home/home_screen.dart';
import 'package:vinhcine/src/features/authentication/presentation/views/signin_screen.dart';
import 'package:vinhcine/src/features/profile/presentation/views/profile_screen.dart';

part './routes/home_routes.dart';
part './routes/detail_routes.dart';
part 'routes/signin_routes.dart';
part 'routes/register_routes.dart';
part 'routes/forgot_password_routes.dart';
part 'routes/profile_routes.dart';

part 'router.gr.dart';

@AutoRouterConfig(generateForDir: ['lib/src'], replaceInRouteName: 'Page,Route')
class RootRouter extends _$RootRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            path: '/',
            page: RootWrapperPageRoute.page,
            children: [..._homeRoutes, ..._detailsRoutes, ..._signInRoutes, ..._registerRoutes, ..._forgotPasswordRoutes, ..._profileRoutes]),
      ];
}

@RoutePage(name: 'RootWrapperPageRoute')
class RootWrapperPage extends StatelessWidget {
  const RootWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<DetailCubit>(create: ((context) => di<DetailCubit>()))
    ], child: const AutoRouter());
  }
}
