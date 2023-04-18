import 'package:global_configuration/global_configuration.dart';

class AppConfig {
  static const String appId = 'it.thoson';
  static const String appName = 'Flutter Demo';
  static const String version = '1.0.0';

  ///Network
  static final baseUrl = "${GlobalConfiguration().getValue('baseUrl')}";

  ///Paging
  static const pageSize = 40;
  static const pageSizeMax = 1000;
}

class FirebaseConfig {
  //Todo
}

class DatabaseConfig {
  //Todo
  static const int version = 1;
}

class MovieAPIConfig {
  static const String APIKey = '26763d7bf2e94098192e629eb975dab0';
}
