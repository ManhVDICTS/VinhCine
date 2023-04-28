import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/components/button/app_button.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/router/route_names.dart';
import '../cubit/auth_cubit.dart';

// ignore_for_file: must_be_immutable
@RoutePage(name: signInScreenName)
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _usernameController =
      TextEditingController(text: 'manhptit123@gmail.com');
  final _passwordController = TextEditingController(text: '111111');

  late AuthCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
        create: (_) {
          _cubit = di<AuthCubit>();
          _cubit.initData();
          return _cubit;
        },
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SignInFail) {
              _showMessage(message: 'Login fail', context: context);
            } else if (state is SignInSuccess) {
              _showMessage(message: 'Login success', context: context);
            } else if (state is GetTokenSuccess) {
              if(state.token.isNotEmpty) {
                _showMessage(message: state.token, context: context);
              }
            } else if (state is UserNameInvalid) {
              _showMessage(message: "User name invalid", context: context);
            } else if (state is PasswordInvalid) {
              _showMessage(message: "Password invalid", context: context);
            } else if (state is SignOutSuccess) {
              _showMessage(message: "Logout success", context: context);
            } else if (state is SignOutFail) {
              _showMessage(message: "Logout fail", context: context);
            }
          },
          child: _buildBodyWidget(),
        ));
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
      ],
    );
  }

  Widget buildSignOutWidget() {
    return Center(
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final isLoading = state is SignOutLoading;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppWhiteButton(
              title: 'Sign Out',
              onPressed: isLoading ? null : _cubit.signOut,
              isLoading: isLoading,
            ),
          );
        },
      ),
    );
  }

  Widget _buildBodyWidget() {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(title: const Text('Sign In Screen')),
      body: BlocSelector<AuthCubit, AuthState, bool>(
        selector: (state) => (state is GetTokenSuccess && state.token.isNotEmpty) ||
            (state is SignInSuccess && state.token.isNotEmpty),
        builder: (context, isAuthenticated) {
          return isAuthenticated ? buildSignOutWidget() : buildSignInWidget();
        },
      ),
    );
  }

  void _signIn() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    bool validUser = _cubit.checkUserName(username);
    bool validPassword = _cubit.checkPassword(password);
    if (validUser && validPassword) _cubit.signIn(username, password);
  }

  void _showMessage({required String message, required BuildContext context}) {
    var snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
