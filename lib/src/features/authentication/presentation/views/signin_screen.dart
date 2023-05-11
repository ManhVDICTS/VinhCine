// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/components/button/app_button.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';
import 'package:vinhcine/src/router/router.dart';
import '../../../../core/di/injections.dart';
import '../../../../router/route_names.dart';
import '../cubit/auth_cubit.dart';

@RoutePage(name: signInScreenRoute)
class SignInScreen extends StatelessWidget implements AutoRouteWrapper{
  SignInScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthCubit>(
          create: ((context) => di<AuthCubit>()))
    ], child: this);
  }

  final _usernameController =
      TextEditingController(text: 'manhptit123@gmail.com');
  final _passwordController = TextEditingController(text: '111111');

  late BuildContext _currentContext;

  @override
  Widget build(BuildContext context) {
    _currentContext = context;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInFail) {
          _showMessage(message: 'Login fail', context: context);
        } else if (state is SignInSuccess) {
          _currentContext.router.pop();
        } else if (state is GetTokenSuccess) {
          if (state.token.isNotEmpty) {
            _showMessage(message: state.token, context: context);
          }
        } else if (state is UserNameInvalid) {
          _showMessage(message: "User name invalid", context: context);
        } else if (state is PasswordInvalid) {
          _showMessage(message: "Password invalid", context: context);
        }
      },
      child: _buildBodyWidget(),
    );
  }

  Widget buildSignInWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 48,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: _usernameController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Username',
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 48,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            ),
          ),
        ),
        const SizedBox(height: 32),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isLoading = state is SignInLoading;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppWhiteButton(
                title: 'Sign In',
                onPressed: isLoading ? null : _signIn,
                isLoading: isLoading,
              ),
            );
          },
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: AppWhiteButton(
            title: 'Register',
            onPressed: () => {_currentContext.pushRoute(RegisterScreenRoute())},
            isLoading: false,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppWhiteButton(
            title: 'Forgot password',
            onPressed: () =>
                {_currentContext.pushRoute(ForgotPasswordScreenRoute())},
            isLoading: false,
          ),
        )
      ],
    );
  }

  Widget _buildBodyWidget() {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(title: const Text('Sign In Screen')),
      body: buildSignInWidget(),
    );
  }

  void _signIn() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    bool validUser = _currentContext.read<AuthCubit>().checkUserName(username);
    bool validPassword =
        _currentContext.read<AuthCubit>().checkPassword(password);
    if (validUser && validPassword) {
      _currentContext.read<AuthCubit>().signIn(username, password);
    }
  }

  void _showMessage({required String message, required BuildContext context}) {
    var snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
