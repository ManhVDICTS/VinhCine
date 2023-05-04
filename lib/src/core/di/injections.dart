import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vinhcine/src/configs/app_configs/app_config.dart';
import 'package:vinhcine/src/core/network/client/client_provider.dart';
import 'package:vinhcine/src/core/shared_prefs/access_token_storage.dart';
import 'package:vinhcine/src/features/detail/presentation/cubit/detail_cubit.dart';
import 'package:vinhcine/src/features/authentication/domain/data/services/auth_service.dart';
import 'package:vinhcine/src/router/router.dart';
import 'package:vinhcine/src/features/authentication/domain/data/services/auth_service_no_token.dart';
import 'package:vinhcine/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:vinhcine/src/features/authentication/presentation/cubit/auth_cubit.dart';

import '../../features/detail/data/remote/services/genre_service.dart';
import '../../features/detail/domain/repositories/movie_repository.dart';

final di = GetIt.instance;

Future<void> initDependencies() async {
  di
    ..registerSingleton<AppConfig>(AppConfig.init())
    ..registerSingleton<RootRouter>(RootRouter())
    ..registerSingleton<GenreService>(
      GenreService(dio(di<AppConfig>())),
    )
    ..registerSingleton<MovieGenreRepository>(
      MovieGenreRepositoryImpl(di<GenreService>()),
    )
    ..registerFactory<DetailCubit>(
        () => DetailCubit(di<MovieGenreRepository>()))
    /// shared preference
    ..registerFactory<AccessTokenStorage>(
        AccessTokenStorage.new)
    /// sign out
    ..registerSingleton<AuthService>(
      AuthService(authDio(di<AppConfig>())),
    )
    /// sign in
    ..registerSingleton<AuthServiceNoToken>(
      AuthServiceNoToken(dio(di<AppConfig>())),
    )
    ..registerSingleton<AuthRepository>(
      AuthRepositoryImpl(di<AuthServiceNoToken>(), di<AuthService>()),
    )
    ..registerFactory<AuthCubit>(
            () => AuthCubit(di<AuthRepository>()),
    );
}
