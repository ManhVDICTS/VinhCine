import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinhcine/blocs/app_cubit.dart';
import 'package:vinhcine/commons/app_colors.dart';
import 'package:vinhcine/repositories/auth_repository.dart';
import 'package:vinhcine/router/application.dart';
import 'package:vinhcine/router/routers.dart';
import 'package:vinhcine/ui/pages/splash/splash_cubit.dart';
import 'package:vinhcine/ui/widgets/loading_indicator_widget.dart';
import 'package:vinhcine/utils/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  late SplashCubit _cubit;
  late AppCubit _appCubit;

  @override
  void initState() {
    _cubit = context.read<SplashCubit>();
    _appCubit = context.read<AppCubit>();
    super.initState();
    _cubit.checkLogin();
    _appCubit.fetchData();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: MultiBlocListener(
        listeners: [
          BlocListener<AppCubit, AppState>(
            listener: (context, state) {
              if(state is FetchedFullDataSuccessfully){
                // do nothing
              }
            },
          ),
          BlocListener<SplashCubit, SplashState>(
            listener: (context, state) {
              if(state is NeedToGoHome){
                showHome();
              } else if(state is NeedToSignOut){
                showSignIn();
              }
            },
          ),
        ],
        child: Center(
          child: LoadingIndicatorWidget(color: Colors.white),
        ),
      ),
    );
  }

  ///Navigate
  void showSignIn() async {
    await Application.router?.navigateTo(context, Routes.signIn);
    _cubit.checkLogin();
  }

  void showHome() {
    Application.router?.navigateTo(context, Routes.home);
  }
}
