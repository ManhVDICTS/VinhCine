import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/components/button/app_button.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/router/route_names.dart';
import '../../../../components/appbar/custom_app_bar.dart';
import '../../../../components/text_field/custom_text_field.dart';
import '../cubit/auth_cubit.dart';

// ignore_for_file: must_be_immutable
@RoutePage(name: forgotPasswordScreenName)
class ForgotPasswordScreen extends StatelessWidget implements AutoRouteWrapper {
  ForgotPasswordScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthCubit>(create: ((context) => di<AuthCubit>()))
    ], child: this);
  }

  final _userNameController =
      TextEditingController(text: 'manhptit123@gmail.com');

  late BuildContext _currentContext;
  late AppColors? appColors;

  @override
  Widget build(BuildContext context) {
    _currentContext = context;
    appColors = Theme.of(context).extension<AppColors>();
    return BlocListener<AuthCubit, AuthState>(
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
    );
  }

  Widget _buildBodyWidget() {
    return Scaffold(
      backgroundColor: appColors!.forgotPasswordBackground,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _buildBanner(),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                    controller: _userNameController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email hoặc số điện thoại',
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColorss.borderColor),
                    enabledBorderColor: appColors!.forgotPasswordSeparateColor,
                    focusedBorderColor: appColors!.forgotPasswordFocusColor,
                    closeColor: appColors!.forgotPasswordBackground,
                  ),
                ),
                const SizedBox(height: 32),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    final isLoading = state is ForgotPasswordLoading;
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppButton(
                        title: 'Tạo mật khẩu mới',
                        onPressed: isLoading ? null : _forgotPassword,
                        isLoading: isLoading,
                        backgroundColor: appColors!.forgotPasswordButtonColor,
                        textColor: appColors!.forgotPasswordTextButtonColor,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          CustomAppBar(
              title: "Quên mật khẩu",
              brightness: false,
              onPressedLeading: () => _currentContext.router.pop()),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    var statusBarHeight = MediaQuery.of(_currentContext).viewPadding.top;
    return Container(
      width: MediaQuery.of(_currentContext).size.width,
      height: statusBarHeight + 48,
      color: appColors!.forgotPasswordAppbar,
    );
  }

  void _forgotPassword() {
    final userName = _userNameController.text;
    bool validEmail = _currentContext.read<AuthCubit>().checkEmail(userName);
    if (validEmail) {
      _currentContext.read<AuthCubit>().forgotPassword(userName);
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
