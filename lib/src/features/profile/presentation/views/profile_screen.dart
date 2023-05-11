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

import '../../../authentication/presentation/cubit/auth_cubit.dart';

@RoutePage(name: profileScreenName)
class ProfileScreen extends StatelessWidget implements AutoRouteWrapper {
  ProfileScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ProfileCubit>(
          create: ((context) => di<ProfileCubit>()..getMyProfile())),
      BlocProvider<AuthCubit>(
          create: ((context) => di<AuthCubit>()))
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
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(title: const Text('Profile Screen')),
      body: const Center(
        child: Text("Loading"),
      ),
    );
  }

  Widget _buildFail() {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(title: const Text('Profile Screen')),
      body: const Center(
        child: Text("Fail"),
      ),
    );
  }

  Widget _buildBodyWidget(MyProfile myProfile) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(title: const Text('Profile Screen')),
      body: Column(
        children: [
          ProfileCard(
            myProfile: myProfile,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: AppWhiteButton(
              title: 'Thay đổi thông tin tài khoản',
              onPressed: () => {},
              isLoading: false,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppWhiteButton(
              title: 'Thay đổi mật khẩu',
              onPressed: () => {},
              isLoading: false,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: AppWhiteButton(
              title: 'Lịch sử giao dịch',
              onPressed: () => {},
              isLoading: false,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildSignOutButton(),
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
        return AppWhiteButton(
          title: 'Sign Out',
          onPressed:
          isLoading ? null : _currentContext.read<AuthCubit>().signOut,
          isLoading: isLoading,
        );
      },
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
