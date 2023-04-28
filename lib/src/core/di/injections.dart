import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vinhcine/src/configs/app_configs/app_config.dart';
import 'package:vinhcine/src/core/network/client/client_provider.dart';
import 'package:vinhcine/src/core/shared_prefs/shared_prefs_provider.dart';
import 'package:vinhcine/src/features/detail/presentation/cubit/detail_cubit.dart';
import 'package:vinhcine/src/features/signin/domain/data/services/signin_service.dart';
import 'package:vinhcine/src/features/signin/domain/repositories/signin_repository.dart';
import 'package:vinhcine/src/features/signin/presentation/cubit/signin_cubit.dart';

import '../../features/detail/data/remote/services/genre_service.dart';
import '../../features/detail/domain/repositories/movie_repository.dart';

final di = GetIt.instance;

Future<void> initDependencies() async {
  di
    ..registerSingleton<AppConfig>(AppConfig.init())
    ..registerSingleton<Dio>(getDio(di<AppConfig>()))
    ..registerSingleton<GenreService>(
      GenreService(di<Dio>()),
    )
    ..registerSingleton<MovieGenreRepository>(
      MovieGenreRepositoryImpl(di<GenreService>()),
    )
    ..registerFactory<DetailCubit>(
        () => DetailCubit(di<MovieGenreRepository>()))
    /// shared preference
    ..registerFactory<SingInProviderImpl>(
        SingInProviderImpl.new)
    /// sign in
    ..registerSingleton<SignInService>(
      SignInService(di<Dio>()),
    )
    ..registerSingleton<SignInRepository>(
      SignInRepositoryImpl(di<SignInService>()),
    )
    ..registerFactory<SignInCubit>(
            () => SignInCubit(di<SignInRepository>()));
}
