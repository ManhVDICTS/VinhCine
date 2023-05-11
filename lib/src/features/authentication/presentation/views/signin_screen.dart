// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/components/button/app_button.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';
import 'package:vinhcine/src/router/router.dart';
import '../../../../components/appbar/custom_app_bar.dart';
import '../../../../components/button/icon_button.dart';
import '../../../../components/text_field/custom_text_field.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildBanner(),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: _usernameController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Email hoặc số điện thoại',
              hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.borderColor),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              hintText: 'Mật khẩu',
              hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.borderColor),
            ),
          ),
          const SizedBox(height: 32),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final isLoading = state is SignInLoading;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppCrimsonButton(
                  title: 'Đăng nhập',
                  onPressed: isLoading ? null : _signIn,
                  isLoading: isLoading,
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppWhiteButton(
              title: 'Quên mật khẩu?',
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.normal,
              onPressed: () =>
              {_currentContext.pushRoute(ForgotPasswordScreenRoute())},
              isLoading: false,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildOr(),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppBorderButton(
              title: 'Đăng ký tài khoản',
              onPressed: () => {_currentContext.pushRoute(RegisterScreenRoute())},
              isLoading: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyWidget() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          buildSignInWidget(),
          CustomAppBar(
              title: "Đăng nhập",
              onPressed: () => _currentContext.router.pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildOr(){
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
              alignment: Alignment.center,
              child: Container(color: AppColors.borderColor, height: 1)),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            child: const Text("hoặc", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                color: Colors.black),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBanner(){
    return AspectRatio(
        aspectRatio: 2/1,
        child: CachedNetworkImage(
          imageUrl: 'https://s3-media0.fl.yelpcdn.com/bphoto/nNA9lP0gkEnFTI3CQrq8lA/o.jpg',
          fit: BoxFit.cover,
        ),
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
