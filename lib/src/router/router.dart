import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:vinhcine/src/features/authentication/presentation/views/forgot_password_screen.dart';
import 'package:vinhcine/src/features/authentication/presentation/views/register_screen.dart';
import 'package:vinhcine/src/features/banner/presentation/cubit/banner_cubit.dart';
import 'package:vinhcine/src/features/authentication/presentation/views/signin_screen.dart';
import 'package:vinhcine/src/features/home/presentation/views/home_screen.dart';
import 'package:vinhcine/src/features/profile/presentation/views/profile_screen.dart';
import 'package:vinhcine/src/features/setting/presentation/views/setting_screen.dart';
import 'package:vinhcine/src/router/routes/guards/secure_guards.dart';

import '../features/profile/presentation/views/change_password_screen.dart';

part 'routes/home_routes.dart';
part 'routes/auth_routes.dart';
part 'routes/profile_routes.dart';
part 'routes/setting_routes.dart';

part 'router.gr.dart';

@AutoRouterConfig(generateForDir: ['lib/src'], replaceInRouteName: 'Page,Route')
class RootRouter extends _$RootRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: RootWrapperPageRoute.page, children: [
          ..._homeRoutes,
          ..._authRoutes,
          ..._profileRoutes,
          ..._settingRoutes,
        ]),
      ];
}

@RoutePage(name: 'RootWrapperPageRoute')
class RootWrapperPage extends StatelessWidget {
  const RootWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<BannerCubit>(
          create: (context) => di<BannerCubit>()..getBanner()),
    ], child: const AutoRouter());
  }
}
