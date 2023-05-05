import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/components/button/app_button.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/router/route_names.dart';
import 'package:vinhcine/src/router/router.dart';
import '../cubit/auth_cubit.dart';

// ignore_for_file: must_be_immutable
@RoutePage(name: forgotPasswordScreenName)
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final _userNameController =
      TextEditingController(text: 'manhptit123@gmail.com');

  late AuthCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
        create: (_) {
          _cubit = di<AuthCubit>();
          return _cubit;
        },
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is EmailInvalid) {
              _showMessage(message: "Email invalid", context: context);
            } else if (state is ForgotPasswordSuccess) {
              _showMessage(message: "Forgot password success", context: context);
            } else if (state is ForgotPasswordFail) {
              _showMessage(message: state.message, context: context);
            }
          },
          child: _buildBodyWidget(),
        ));
  }

  Widget _buildBodyWidget() {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(title: const Text('Forgot Password Screen')),
      body: Column(
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
              controller: _userNameController,
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
          const SizedBox(height: 32),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final isLoading = state is ForgotPasswordLoading;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppWhiteButton(
                  title: 'Create new password',
                  onPressed: isLoading ? null : _forgotPassword,
                  isLoading: isLoading,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _forgotPassword() {
    final userName = _userNameController.text;
    bool validEmail = _cubit.checkEmail(userName);
    if (validEmail) {
      _cubit.forgotPassword(userName);
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
