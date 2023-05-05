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

// ignore_for_file: must_be_immutable
@RoutePage(name: profileScreenName)
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  late ProfileCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
        create: (_) {
          _cubit = di<ProfileCubit>();
          _cubit.getMyProfile();
          return _cubit;
        },
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if(state is GetMyProfileSuccess){
              return _buildBodyWidget(state.profile);
            } else if(state is GetMyProfileLoading){
              return _buildLoading();
            } else if(state is GetMyProfileFail){
              return _buildFail();
            }
            return Container();
          },
        ));
  }

  Widget _buildLoading(){
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(title: const Text('Profile Screen')),
      body: const Center(
        child: Text("Loading"),
      ),
    );
  }

  Widget _buildFail(){
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
          )
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
