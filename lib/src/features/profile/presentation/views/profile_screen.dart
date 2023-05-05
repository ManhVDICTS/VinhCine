import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/features/profile/presentation/cubit/profile_cubit.dart';
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
          return _cubit;
        },
        child: BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            /// do nothing
          },
          child: _buildBodyWidget(),
        ));
  }

  Widget _buildBodyWidget() {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(title: const Text('Profile Screen')),
      body: const Center(child: Text("Profile"),),
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
