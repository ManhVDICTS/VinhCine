part of '../router.dart';

final _profileRoutes = [
  AutoRoute(path: 'profile', page: ProfileScreenRoute.page, guards: [AuthGuard()],),
  AutoRoute(path: 'change_password', page: ChangePasswordScreenRoute.page,)
];
