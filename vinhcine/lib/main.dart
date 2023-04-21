import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'configs/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appConfig = AppConfig.init();
  await initAwaitServices();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('vi'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('vi'),
      useOnlyLangCode: true,
      useFallbackTranslations: true,
      child: const MyApp(),
    ),
  );
}

// AWAIT SERVICES INITIALIZATION.
Future initAwaitServices() async {
  await Future.wait([
    Hive.initFlutter(),
    EasyLocalization.ensureInitialized()
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
