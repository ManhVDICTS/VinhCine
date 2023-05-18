import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/core/global/global_event.dart';
import 'package:vinhcine/src/router/router.dart';

import 'src/configs/app_themes/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await initAwaitServices();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('vi', 'VN'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('vi'),
      useOnlyLangCode: true,
      useFallbackTranslations: true,
      child: MyApp(),
    ),
  );
}

// AWAIT SERVICES INITIALIZATION.
Future initAwaitServices() async {
  await Future.wait([Hive.initFlutter(), EasyLocalization.ensureInitialized()]);
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _rootRouter = di<RootRouter>();

  final _notifier = ValueNotifier(ThemeMode.light);

  @override
  void initState() {
    GlobalEvent.instance.refreshThemeEvent.stream.listen((mode) {
      _notifier.value = mode;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _notifier,
      builder: (_, mode, __) {
        return MaterialApp.router(
          routerConfig: _rootRouter.config(),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          themeMode: mode,
          theme: getThemeDefault(),
          darkTheme: getDarkDefault(),
        );
      },
    );
  }
}
