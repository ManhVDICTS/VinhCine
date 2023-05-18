import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/components/appbar/custom_app_bar.dart';
import 'package:vinhcine/src/components/button/app_button.dart';
import 'package:vinhcine/src/configs/app_themes/app_colors.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:vinhcine/src/features/setting/presentation/views/widgets/language/cubit/language_cubit.dart';
import 'package:vinhcine/src/features/setting/presentation/views/widgets/language/language_widget.dart';
import 'package:vinhcine/src/features/setting/presentation/views/widgets/theme/theme_widget.dart';
import 'package:vinhcine/src/router/route_names.dart';

@RoutePage(name: settingScreenName)
class SettingScreen extends StatelessWidget implements AutoRouteWrapper{

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<SettingCubit>(create: (context) => di<SettingCubit>()),
    ], child: this);
  }

  late BuildContext _currentContext;
  final _controller = LanguageController(initLocale: const Locale.fromSubtags(languageCode: 'vi'));
  final _themeController = ThemeController(initTheme: false);

  @override
  Widget build(BuildContext context) {
    _currentContext = context;
    return Scaffold(
      backgroundColor: AppColorss.brown,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBanner(),
                const SizedBox(height: 36),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildDescription("setting.language".tr())),
                const SizedBox(height: 12),
                LanguageWidget(
                    controller: _controller,
                    onChanged: (Locale? obj) {
                      print('onChanged = ${_controller.language.languageCode}');
                    },
                ),
                const SizedBox(height: 12),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildDescription("setting.theme".tr())),
                const SizedBox(height: 12),
                ThemeWidget(
                  controller: _themeController,
                  onChanged: (bool? obj) {
                    print('on Changed isDark = ${_themeController.isDark}');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: AppCrimsonButton(
                    title: 'Hiện ngôn ngữ đang được chọn',
                    onPressed: (){
                      print('ngôn ngữ = ${_controller.language.languageCode}');
                      print('giao diện tối = ${_themeController.isDark}');
                    },
                    isLoading: false,
                  ),
                )
              ],
            ),
          ),
          CustomAppBar(
              brightness: false,
              title: 'setting.title'.tr(),
              onPressed: () => _currentContext.router.pop()),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    var statusBarHeight = MediaQuery.of(_currentContext).viewPadding.top;
    return Container(
      width: MediaQuery.of(_currentContext).size.width,
      height: statusBarHeight + 48,
      color: AppColorss.crimson,
    );
  }

  Widget _buildDescription(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColorss.darkBrown),
    );
  }

}