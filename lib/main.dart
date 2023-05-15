import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/router/router.dart';

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

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _rootRouter = di<RootRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _rootRouter.config(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
