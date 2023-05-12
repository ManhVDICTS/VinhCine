import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/components/button/app_button.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/features/profile/domain/model/my_profile.dart';
import 'package:vinhcine/src/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:vinhcine/src/features/profile/presentation/views/widgets/profile_card.dart';
import 'package:vinhcine/src/router/route_names.dart';
import '../../../../components/appbar/custom_app_bar.dart';
import '../../../authentication/presentation/cubit/auth_cubit.dart';
import 'widgets/optional_item.dart';

@RoutePage(name: profileScreenName)
class ProfileScreen extends StatelessWidget implements AutoRouteWrapper {
  ProfileScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ProfileCubit>(
          create: ((context) => di<ProfileCubit>()..getMyProfile())),
      BlocProvider<AuthCubit>(create: ((context) => di<AuthCubit>())),
    ], child: this);
  }

  late BuildContext _currentContext;

  @override
  Widget build(BuildContext context) {
    _currentContext = context;
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is GetMyProfileSuccess) {
          return _buildBodyWidget(state.profile);
        } else if (state is GetMyProfileLoading) {
          return _buildLoading();
        } else if (state is GetMyProfileFail) {
          return _buildFail();
        }
        return Container();
      },
    );
  }

  Widget _buildLoading() {
    return _buildScaffoldWidget(
      child: const Center(
        child: Text("Loading..."),
      ),
    );
  }

  Widget _buildFail() {
    return _buildScaffoldWidget(
      child: const Center(
        child: Text("Fail"),
      ),
    );
  }

  Widget _buildBodyWidget(MyProfile myProfile) {
    return _buildScaffoldWidget(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileCard(
                  myProfile: myProfile,
                ),
                const SizedBox(height: 12),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(color: AppColors.borderColor, height: 1)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: OptionalItem(
                    text: 'Thay đổi thông tin tài khoản',
                    leadingIcon:
                        const Icon(Icons.person, color: AppColors.crimson),
                    onTap: () {
                      /// todo do something here
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: OptionalItem(
                    text: 'Thay đổi mật khẩu',
                    leadingIcon: const Icon(Icons.password_outlined,
                        color: AppColors.crimson),
                    onTap: () {
                      /// todo do something here
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: OptionalItem(
                    text: 'Lịch sử giao dịch',
                    leadingIcon: const Icon(
                      Icons.history,
                      color: AppColors.crimson,
                    ),
                    onTap: () {
                      /// todo do something here
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: _buildSignOutButton(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignOutButton() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          _currentContext.router.pop();
        } else if (state is SignOutFail) {
          _showMessage(message: "Logout fail", context: context);
        }
      },
      builder: (context, state) {
        final isLoading = state is SignOutLoading;
        return AppCrimsonButton(
          title: 'Đăng xuất',
          onPressed:
              isLoading ? null : _currentContext.read<AuthCubit>().signOut,
          isLoading: isLoading,
        );
      },
    );
  }

  Widget _buildBanner() {
    var statusBarHeight = MediaQuery.of(_currentContext).viewPadding.top;
    return Container(
      width: MediaQuery.of(_currentContext).size.width,
      height: statusBarHeight + 48,
      color: AppColors.crimson,
    );
  }

  Widget _buildScaffoldWidget({required Widget child}) {
    return Scaffold(
      backgroundColor: AppColors.borderColor,
      body: Stack(
        children: [
          Column(
            children: [
              _buildBanner(),
              Expanded(
                child: child,
              )
            ],
          ),
          CustomAppBar(
              brightness: false,
              title: "Thành viên",
              onPressed: () => _currentContext.router.pop()),
        ],
      ),
    );
  }

  void _showMessage({required String message, required BuildContext context}) {
    var snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
