import 'package:get_it/get_it.dart';
import 'package:vinhcine/src/configs/app_configs/app_config.dart';
import 'package:vinhcine/src/core/network/client/client_provider.dart';
import 'package:vinhcine/src/core/shared_prefs/access_token_storage.dart';
import 'package:vinhcine/src/features/banner/data/remote/services/banner_service.dart';
import 'package:vinhcine/src/features/banner/domain/repositories/banner_repository.dart';
import 'package:vinhcine/src/features/banner/presentation/cubit/banner_cubit.dart';
import 'package:vinhcine/src/features/home/data/remote/services/toppage_service.dart';
import 'package:vinhcine/src/features/home/domain/repositories/movie_repository.dart';
import 'package:vinhcine/src/features/home/presentation/cubit/movie_data_cubit.dart';
import 'package:vinhcine/src/features/home/presentation/cubit/movie_selector_cubit.dart';
import 'package:vinhcine/src/features/profile/data/remote/services/profile_service.dart';
import 'package:vinhcine/src/features/profile/data/remote/services/profile_service_no_token.dart';
import 'package:vinhcine/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:vinhcine/src/features/profile/presentation/cubit/change_password/change_password_cubit.dart';
import 'package:vinhcine/src/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:vinhcine/src/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:vinhcine/src/features/setting/presentation/views/widgets/language/cubit/language_cubit.dart';
import 'package:vinhcine/src/features/setting/presentation/views/widgets/theme/cubit/theme_cubit.dart';
import 'package:vinhcine/src/router/router.dart';
import 'package:vinhcine/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:vinhcine/src/features/authentication/presentation/cubit/auth_cubit.dart';

import '../../features/authentication/data/remote/services/auth_service.dart';
import '../../features/authentication/data/remote/services/auth_service_no_token.dart';
part 'banner_di.dart';
part 'movie_di.dart';

final di = GetIt.instance;

Future<void> initDependencies() async {
  di
    ..registerSingleton<AppConfig>(AppConfig.init())
    ..registerFactory<AccessTokenStorage>(AccessTokenStorage.new)
    ..registerSingleton<AppDio>(AppDio.init(di<AppConfig>()))
    ..registerSingleton<RootRouter>(RootRouter())
    /// sign in, sign out
    ..registerSingleton<AuthService>(
      AuthService(di<AppDio>().authDio),
    )
    ..registerSingleton<AuthServiceNoToken>(
      AuthServiceNoToken(di<AppDio>().baseDio),
    )
    ..registerSingleton<AuthRepository>(
      AuthRepositoryImpl(di<AuthServiceNoToken>(), di<AuthService>()),
    )
    ..registerFactory<AuthCubit>(
      () => AuthCubit(di<AuthRepository>()),
    )

    /// profile
    ..registerSingleton<ProfileService>(
      ProfileService(di<AppDio>().authDio),
    )
    ..registerSingleton<ProfileServiceNoToken>(
      ProfileServiceNoToken(di<AppDio>().baseDio),
    )
    ..registerSingleton<ProfileRepository>(
      ProfileRepositoryImpl(di<ProfileServiceNoToken>(), di<ProfileService>()),
    )
    ..registerFactory<ProfileCubit>(
      () => ProfileCubit(di<ProfileRepository>()),
    )
    ..registerFactory<ChangePasswordCubit>(
          () => ChangePasswordCubit(di<ProfileRepository>()),
    )
    ..registerFactory<SettingCubit>(
          () => SettingCubit(),
    )
    ..registerFactory<LanguageCubit>(
          () => LanguageCubit(),
    )
    ..registerFactory<ThemeCubit>(
          () => ThemeCubit(),
    );

  initBanner(di);
  initMovie(di);
}
