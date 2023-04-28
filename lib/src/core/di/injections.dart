import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vinhcine/src/configs/app_configs/app_config.dart';
import 'package:vinhcine/src/core/network/client/client_provider.dart';
import 'package:vinhcine/src/core/shared_prefs/shared_prefs_provider.dart';
import 'package:vinhcine/src/features/detail/presentation/cubit/detail_cubit.dart';
import 'package:vinhcine/src/features/signin/domain/data/services/signout_service.dart';
import 'package:vinhcine/src/router/router.dart';
import 'package:vinhcine/src/features/signin/domain/data/services/signin_service.dart';
import 'package:vinhcine/src/features/signin/domain/repositories/signin_repository.dart';
import 'package:vinhcine/src/features/signin/presentation/cubit/signin_cubit.dart';

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
    ..registerFactory<SharedPrefProvider>(
        SharedPrefProvider.new)
    /// sign out
    ..registerSingleton<SignOutService>(
      SignOutService(authDio(di<AppConfig>())),
    )
    /// sign in
    ..registerSingleton<SignInService>(
      SignInService(dio(di<AppConfig>())),
    )
    ..registerSingleton<SignInRepository>(
      SignInRepositoryImpl(di<SignInService>(), di<SignOutService>()),
    )
    ..registerFactory<SignInCubit>(
            () => SignInCubit(di<SignInRepository>()),
    );
}
