part of 'injections.dart';

void initBanner(GetIt di) {
  di

    /// Service
    ..registerSingleton<BannerService>(
      BannerService(di<AppDio>().baseDio),
    )

    /// Repository
    ..registerSingleton<BannerRepository>(
        BannerRepositoryImpl(di<BannerService>()))

    /// Cubit
    ..registerSingleton<BannerCubit>(BannerCubit(di<BannerRepository>()));
}
