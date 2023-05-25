part of 'injections.dart';

void initMovie(GetIt di) {
  di
    ..registerSingleton<MovieService>(
      MovieService(di<AppDio>().baseDio),
    )
    ..registerSingleton<MovieRepository>(
      MovieRepositoryImpl(di<MovieService>()),
    )
    ..registerSingleton<MovieDataCubit>(MovieDataCubit(di<MovieRepository>()))
    ..registerSingleton<MovieTabCubit>(MovieTabCubit())
    ..registerSingleton<MovieSelectorCubit>(MovieSelectorCubit());
}
