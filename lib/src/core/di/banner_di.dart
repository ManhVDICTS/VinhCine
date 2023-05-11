import 'package:get_it/get_it.dart';
import 'package:vinhcine/src/configs/app_configs/app_config.dart';
import 'package:vinhcine/src/core/network/client/client_provider.dart';
import 'package:vinhcine/src/features/banner/data/remote/services/banner_service.dart';
import 'package:vinhcine/src/features/banner/domain/repositories/banner_repository.dart';
import 'package:vinhcine/src/features/banner/presentation/cubit/banner_cubit.dart';

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
