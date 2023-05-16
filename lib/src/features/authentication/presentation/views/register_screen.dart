import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/components/button/app_button.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:vinhcine/src/router/route_names.dart';
import '../../../../components/appbar/custom_app_bar.dart';
import '../../../../components/text_field/custom_text_field.dart';
import '../../../../configs/app_themes/app_colors.dart';

@RoutePage(name: registerScreenName)
class RegisterScreen extends StatelessWidget implements AutoRouteWrapper {
  RegisterScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthCubit>(create: ((context) => di<AuthCubit>()))
    ], child: this);
  }

  late BuildContext _currentContext;
  final _userNameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  final _fullNameController = TextEditingController(text: '');
  final _phoneController = TextEditingController(text: '');

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
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            _buildRegisterWidget(),
            CustomAppBar(
                title: "Đăng ký",
                onPressed: () => _currentContext.router.pop()),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBanner(),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildTextFormField(
              child: CustomTextField(
                controller: _userNameController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColorss.borderColor),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildTextFormField(
              child: CustomTextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                hintText: 'Mật khẩu',
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColorss.borderColor),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildTextFormField(
              child: CustomTextField(
                controller: _fullNameController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Họ tên',
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColorss.borderColor),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildTextFormField(
              child: CustomTextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                hintText: 'Số điện thoại',
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColorss.borderColor),
              ),
            ),
          ),
          const SizedBox(height: 22),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildDescription()),
          const SizedBox(height: 32),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final isLoading = state is RegisterLoading;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppCrimsonButton(
                  title: 'Đăng ký',
                  onPressed: isLoading ? null : _register,
                  isLoading: isLoading,
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildPolicy()),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: CachedNetworkImage(
        imageUrl:
            'https://s3-media0.fl.yelpcdn.com/bphoto/nNA9lP0gkEnFTI3CQrq8lA/o.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTextFormField({required Widget child}) {
    return Row(
      children: [
        const Text(
          "*",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.red),
        ),
        const SizedBox(width: 12),
        Expanded(child: child),
      ],
    );
  }

  Widget _buildDescription() {
    return Row(children: const [
      Text(
        "*",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.red),
      ),
      SizedBox(width: 12),
      Text(
        "Thông tin bắt buộc",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
      ),
    ]);
  }

  Widget _buildPolicy() {
    return RichText(
      text: const TextSpan(children: [
        TextSpan(
          text: "Tôi đồng ý với ",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontStyle: FontStyle.italic),
        ),
        TextSpan(
          text: "Điều khoản sử dụng",
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.red,
              fontStyle: FontStyle.italic),
        ),
        TextSpan(
          text: " và đang mua vé cho người có độ tuổi phù hợp.",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontStyle: FontStyle.italic),
        ),
      ]),
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
