import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/components/button/app_button.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:vinhcine/src/router/route_names.dart';

@RoutePage(name: registerScreenName)
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  late BuildContext _currentContext;
  final _userNameController =
      TextEditingController(text: 'manhptit123@gmail.com');
  final _passwordController = TextEditingController(text: '111111');
  final _fullNameController = TextEditingController(text: 'Manh Dep Trai');
  final _phoneController = TextEditingController(text: '0856787877');

  @override
  Widget build(BuildContext context) {
    _currentContext = context;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          _showMessage(message: "Register success", context: context);
        } else if (state is RegisterFail) {
          _showMessage(message: "Register fail", context: context);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.main,
        appBar: AppBar(title: const Text('Register Screen')),
        body: _buildRegisterWidget(),
      ),
    );
  }

  Widget _buildRegisterWidget() {
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
            controller: _userNameController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'User name',
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
        const SizedBox(height: 12),
        Container(
          height: 48,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: _fullNameController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Full name',
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
            controller: _phoneController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Phone',
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
            final isLoading = state is RegisterLoading;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppWhiteButton(
                title: 'Register',
                onPressed: isLoading ? null : _register,
                isLoading: isLoading,
              ),
            );
          },
        ),
      ],
    );
  }

  void _register() {
    final userName = _userNameController.text;
    final password = _passwordController.text;
    final fullName = _fullNameController.text;
    final phone = _phoneController.text;
    bool validUser = _currentContext.read<AuthCubit>().checkUserName(userName);
    bool validPassword =
        _currentContext.read<AuthCubit>().checkPassword(password);
    bool validFullName =
        _currentContext.read<AuthCubit>().checkFullName(fullName);
    bool validPhone = _currentContext.read<AuthCubit>().checkPhone(phone);

    if (validUser && validPassword && validFullName && validPhone) {
      _currentContext.read<AuthCubit>().register(
          userName: userName,
          password: password,
          fullName: fullName,
          phone: phone);
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
