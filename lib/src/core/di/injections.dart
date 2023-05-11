import 'package:get_it/get_it.dart';
import 'package:vinhcine/src/configs/app_configs/app_config.dart';
import 'package:vinhcine/src/core/network/client/client_provider.dart';
import 'package:vinhcine/src/core/shared_prefs/access_token_storage.dart';
import 'package:vinhcine/src/features/detail/presentation/cubit/detail_cubit.dart';
import 'package:vinhcine/src/features/profile/data/remote/services/profile_service.dart';
import 'package:vinhcine/src/features/profile/data/remote/services/profile_service_no_token.dart';
import 'package:vinhcine/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:vinhcine/src/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:vinhcine/src/router/router.dart';
import 'package:vinhcine/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:vinhcine/src/features/authentication/presentation/cubit/auth_cubit.dart';

import '../../features/authentication/data/remote/services/auth_service.dart';
import '../../features/authentication/data/remote/services/auth_service_no_token.dart';
import '../../features/detail/data/remote/services/genre_service.dart';
import '../../features/detail/domain/repositories/movie_repository.dart';
import 'banner_di.dart';

final di = GetIt.instance;

Future<void> initDependencies() async {
  di
    ..registerSingleton<AppConfig>(AppConfig.init())
    /// shared preference
    ..registerFactory<AccessTokenStorage>(AccessTokenStorage.new)
    ..registerSingleton<AppDio>(AppDio.init(di<AppConfig>()))
    ..registerSingleton<RootRouter>(RootRouter())
    ..registerSingleton<GenreService>(
      GenreService(di<AppDio>().baseDio),
    )
    ..registerSingleton<MovieGenreRepository>(
      MovieGenreRepositoryImpl(di<GenreService>()),
    )
    ..registerFactory<DetailCubit>(
        () => DetailCubit(di<MovieGenreRepository>()))
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
    );

  initBanner(di);
}
