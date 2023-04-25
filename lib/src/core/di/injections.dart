import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vinhcine/src/configs/app_configs/app_config.dart';
import 'package:vinhcine/src/core/network/client/client_provider.dart';
import 'package:vinhcine/src/features/detail/presentation/cubit/detail_cubit.dart';

import '../../features/detail/data/remote/services/genre_service.dart';
import '../../features/detail/domain/repositories/movie_repository.dart';

final di = GetIt.instance;

Future<void> initializeDependencies() async {
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
        () => DetailCubit(di<MovieGenreRepository>()));
}
