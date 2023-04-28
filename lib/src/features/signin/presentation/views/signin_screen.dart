import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/components/button/app_button.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/features/signin/presentation/cubit/signin_cubit.dart';
import 'package:vinhcine/src/router/route_names.dart';

@RoutePage(name: signInScreenName)
class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreenState();
  }
}

class _SignInScreenState extends State<SignInScreen> {
  final _usernameController = TextEditingController(text: 'manhptit123@gmail.com');
  final _passwordController = TextEditingController(text: '111111');

  late SignInCubit _cubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (_) {
        _cubit = di<SignInCubit>();
        _cubit.initData();
        return _cubit;
      },
      child: Scaffold(
        backgroundColor: AppColors.main,
        appBar: AppBar(title: const Text('Sign In Screen')),
        body: BlocListener<SignInCubit, SignInState>(
          listener: (context, state) {
            if (state is SignInFail) {
              _showMessage('Login failure');
            } else if (state is SignInSuccess) {
              Navigator.pop(context);
            } else if (state is InitDataSuccess) {
              _showMessage(state.token);
            }
          },
          child: buildBodyWidget(),
        ),
      ),
    );
  }

  Widget buildBodyWidget() {
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
        _buildSignButton(),
      ],
    );
  }

  Widget _buildSignButton() {
    return BlocBuilder<SignInCubit, SignInState>(
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
    );
  }

  void _signIn() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username.isEmpty) {
      _showMessage('Username is invalid');
      return;
    }
    if (password.isEmpty) {
      _showMessage('Password is invalid');
      return;
    }
    _cubit.signIn(username, password);
  }

  void _showMessage(String message) {
    var snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
