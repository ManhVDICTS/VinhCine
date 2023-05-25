import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/components/button/app_button.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/features/profile/domain/model/my_profile.dart';
import 'package:vinhcine/src/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:vinhcine/src/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:vinhcine/src/router/route_names.dart';
import 'package:vinhcine/src/router/router.dart';
import '../../../../components/appbar/custom_app_bar.dart';
import '../../../authentication/presentation/cubit/auth_cubit.dart';
import 'widgets/optional_item.dart';

@RoutePage(name: profileScreenName)
class ProfileScreen extends StatelessWidget implements AutoRouteWrapper {
  ProfileScreen({super.key});
  late AppColors? appColors;

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
    appColors = Theme.of(context).extension<AppColors>();
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
            color: appColors!.profileItemBackground,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ProfileHeader(
                    myProfile: myProfile,
                  ),
                  const SizedBox(height: 12),
                  Container(color: appColors!.profileSeparateColor, height: 1),
                  OptionalItem(
                    text: 'profile.update_info'.tr(),
                    leadingIcon:
                        Icon(Icons.person, color: appColors!.profileIconColor),
                    onTap: () {
                      /// todo do something here
                    },
                  ),
                  OptionalItem(
                    text: 'profile.change_password'.tr(),
                    leadingIcon: Icon(Icons.password_outlined,
                        color: appColors!.profileIconColor),
                    onTap: () {
                      _currentContext.router.push(ChangePasswordScreenRoute());
                    },
                  ),
                  OptionalItem(
                    text: 'profile.transaction_history'.tr(),
                    leadingIcon: Icon(
                      Icons.history,
                      color: appColors!.profileIconColor,
                    ),
                    onTap: () {
                      /// todo do something here
                    },
                  ),
                  OptionalItem(
                    text: 'setting.title'.tr(),
                    leadingIcon: Icon(
                      Icons.settings,
                      color: appColors!.profileIconColor,
                    ),
                    onTap: () {
                      _currentContext.router.push(const SettingScreenRoute());
                    },
                  ),
                ],
              ),
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
        return AppButton(
          title: 'profile.logout'.tr(),
          onPressed:
              isLoading ? null : _currentContext.read<AuthCubit>().signOut,
          isLoading: isLoading,
          backgroundColor: appColors!.profileButtonColor,
          textColor: appColors!.profileTextButtonColor,
        );
      },
    );
  }

  Widget _buildBanner() {
    var statusBarHeight = MediaQuery.of(_currentContext).viewPadding.top;
    return Container(
      width: MediaQuery.of(_currentContext).size.width,
      height: statusBarHeight + 48,
      color: appColors!.profileAppbar,
    );
  }

  Widget _buildScaffoldWidget({required Widget child}) {
    return Scaffold(
      backgroundColor: appColors!.profileBackground,
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
              hasShadow: false,
              title: 'profile.member'.tr(),
              onPressedLeading: () => _currentContext.router.pop()),
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
