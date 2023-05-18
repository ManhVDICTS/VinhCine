part of 'injections.dart';

void initMovie(GetIt di) {
  di
    ..registerSingleton<TopPageService>(
      TopPageService(di<AppDio>().baseDio),
    )
    ..registerSingleton<MovieRepository>(
      MovieRepositoryImpl(di<TopPageService>()),
    )
    ..registerSingleton<MovieDataCubit>(MovieDataCubit(di<MovieRepository>()))
    ..registerSingleton<MovieTabCubit>(MovieTabCubit())
    ..registerSingleton<MovieSelectorCubit>(MovieSelectorCubit());
}
