import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vinhcine/commons/app_colors.dart';
import 'package:vinhcine/ui/components/app_context.dart';
import 'package:vinhcine/ui/pages/home/home_cubit.dart';
import 'package:vinhcine/ui/pages/home/tabs/movie_tab/movie_tab_cubit.dart';
import 'package:vinhcine/ui/pages/home/tabs/movie_tab/movie_tab_page.dart';
import 'package:vinhcine/ui/pages/home/tabs/notification_tab/notification_tab_page.dart';
import 'package:vinhcine/ui/pages/home/tabs/setting_tab/setting_tab_cubit.dart';
import 'package:vinhcine/ui/pages/home/tabs/setting_tab/setting_tab_page.dart';
import 'package:vinhcine/utils/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../generated/l10n.dart';
import '../../../repositories/auth_repository.dart';
import '../../../repositories/movie_repository.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final _pageController = PageController(initialPage: 0, keepPage: true);

  final tabs = [Tabs.HOME, Tabs.NOTIFICATION, Tabs.SETTING];

  DateTime? _currentBackPressTime;

  late HomeCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<HomeCubit>();
    super.initState();
    _cubit.listen((state) {
      logger.d('Change tab1 ${state.currentTabIndex}');
      // _pageController.animateToPage(state.currentTabIndex,
      //     duration: Duration(milliseconds: 300), curve: Curves.ease);
      _pageController.jumpToPage(state.currentTabIndex!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: AppColors.main,
        body: _buildPageView(),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildPageView() {
    return PageView(
      // physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: tabs.map((e) => e.page).toList(),
      onPageChanged: (index) {
        _cubit.changeTab(index);
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev, current) {
        return prev.currentTabIndex != current.currentTabIndex;
      },
      builder: (context, state) {
        return Theme(
          data: ThemeData(),
          child: BottomNavigationBar(
            currentIndex: state.currentTabIndex!,
            unselectedItemColor: Colors.black54,
            selectedItemColor: AppColors.main,
            items: tabs.map((e) => e.tab).toList(),
            onTap: (index) {
              _cubit.changeTab(index);
            },
          ),
        );
      },
    );
  }

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null || (_currentBackPressTime != null &&
        now.difference(_currentBackPressTime!) > Duration(seconds: 2))) {
      _currentBackPressTime = now;
      Fluttertoast.showToast(
        gravity: ToastGravity.TOP,
        backgroundColor: AppColors.textTint,
        textColor: AppColors.background,
        msg: S.of(context).tapAgainToLeave,
      );
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }
}

enum Tabs {
  HOME,
  NOTIFICATION,
  SETTING,
}

extension TabsExtension on Tabs {
  Widget get page {
    switch (this) {
      case Tabs.HOME:
        return BlocProvider(
          create: (context) {
            final repository = RepositoryProvider.of<MovieRepository>(context);
            return MovieTabCubit(repository: repository);
          },
          child: MovieTabPage(),
        );
      case Tabs.NOTIFICATION:
        return NotificationTabPage();
      case Tabs.SETTING:
        return BlocProvider(
          create: (context) {
            final repository = RepositoryProvider.of<AuthRepository>(context);
            return SettingTabCubit(repository: repository);
          },
          child: SettingTabPage(),
        );
    }
    return Container();
  }

  BottomNavigationBarItem get tab {
    switch (this) {
      case Tabs.HOME:
        return BottomNavigationBarItem(icon: Icon(Icons.home), label: S.of(AppContext.navigatorKey.currentContext!).home);
      case Tabs.NOTIFICATION:
        return BottomNavigationBarItem(icon: Icon(Icons.notifications), label: S.of(AppContext.navigatorKey.currentContext!).notification);
      case Tabs.SETTING:
        return BottomNavigationBarItem(icon: Icon(Icons.settings), label: S.of(AppContext.navigatorKey.currentContext!).setting);
    }
  }

  String get title {
    switch (this) {
      case Tabs.HOME:
        return S.of(AppContext.navigatorKey.currentContext!).home;
      case Tabs.NOTIFICATION:
        return S.of(AppContext.navigatorKey.currentContext!).notification;
      case Tabs.SETTING:
        return S.of(AppContext.navigatorKey.currentContext!).setting;
    }
    return '';
  }
}
