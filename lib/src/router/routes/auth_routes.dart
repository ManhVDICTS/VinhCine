part of '../router.dart';

final _authRoutes = [
  AutoRoute(path: 'auth', page: AuthWrapperPageRoute.page, children: [
    AutoRoute(path: 'signin', page: SignInScreenRoute.page),
    AutoRoute(path: 'register', page: RegisterScreenRoute.page),
    AutoRoute(path: 'forgot_password', page: ForgotPasswordScreenRoute.page)
  ])
];

@RoutePage(name: 'AuthWrapperPageRoute')
class AuthWrapperPage extends StatelessWidget {
  const AuthWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthCubit>(
          create: ((context) => di<AuthCubit>()..initData()))
    ], child: const AutoRouter());
  }
}
