import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/components/button/icon_button.dart';
import 'package:vinhcine/src/configs/app_themes/app_themes.dart';
import 'package:vinhcine/src/features/banner/presentation/views/banner.dart';
import 'package:vinhcine/src/features/home/domain/models/movie_tab.dart';
import 'package:vinhcine/src/features/home/presentation/cubit/movie_tab_cubit.dart';
import 'package:vinhcine/src/features/home/presentation/widgets/cinema_direction.dart';
import 'package:vinhcine/src/features/home/presentation/widgets/movie_info.dart';
import 'package:vinhcine/src/features/home/presentation/widgets/movie_tab_title.dart';
import 'package:vinhcine/src/features/home/presentation/widgets/movies_carousel.dart';
import 'package:vinhcine/src/features/home/presentation/cubit/movie_data_cubit.dart';
import 'package:vinhcine/src/features/home/presentation/cubit/movie_selector_cubit.dart';
import 'package:vinhcine/src/router/route_names.dart';
import 'package:vinhcine/src/router/router.dart';

import '../../../core/di/injections.dart';
import 'widgets/background.dart';

final List<String> moviesList = [
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/7/0/700x1000_2_.jpg',
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/p/o/poster_gttdy_1.jpg',
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/l/m/lm6_2x3_layout.jpg',
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/7/0/700x1000-tid-noi.jpg',
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/g/h/ghost-station_main_fin_viethoa.jpg',
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/7/0/700x1000_4_.jpg'
];

@RoutePage(name: homeScreenName)
class HomeScreen extends StatelessWidget implements AutoRouteWrapper {
  HomeScreen({super.key});
  final double _appBarHeight = 48;

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MovieTabCubit>(
              create: (context) =>
                  di<MovieTabCubit>()..onSelectedTab(MovieTab.now)),
          BlocProvider<MovieDataCubit>(
              create: (context) => di<MovieDataCubit>()
                ..getTopPage(di<MovieTabCubit>().state.selectedTab)),
          BlocProvider(
            create: (context) => di<MovieSelectorCubit>(),
          ),
        ],
        child: MultiBlocListener(listeners: [
          BlocListener<MovieTabCubit, MovieTabState>(
            listenWhen: (previous, current) => previous != current,
            listener: (context, state) {
              if (state is MovieTabSelected) {
                context.read<MovieDataCubit>().getTopPage(state.selectedTab);
              }
            },
          )
        ], child: this));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      _homeBackgroundSwitcher(),
      _homeBackgroundShadow(),
      _body(context),
      _appBar(context)
    ]));
  }

  Widget _homeBackgroundSwitcher() => const HomeBackgroundSwitcher();
  Widget _homeBackgroundShadow() => const Positioned.fill(
        child: HomeBackgroundShadow(),
      );

  Widget _appBar(BuildContext context) => SafeArea(
        child: Container(
          height: _appBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                icon: const Icon(Icons.account_circle,
                    size: 32, color: Colors.white),
                onTap: () {
                  context.router.push(ProfileScreenRoute());
                },
              ),
              Text(
                'home.title'.tr(),
                style: AppStyles.headerMediumBold(context),
              ),
              CustomIconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 32,
                  color: Colors.white,
                ),
                onTap: () {
                  context.router.push(SignInScreenRoute());
                },
              ),
            ],
          ),
        ),
      );

  Widget _body(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        SizedBox(height: _appBarHeight + 20),
        BannerSlider(
          width: MediaQuery.of(context).size.width - 80,
          height: 170,
        ),
        const MovieTabTitle(),
        const Expanded(child: MoviesCarousel(width: 300, height: 400)),
        const MovieInfo(),
        const CinemaDirection()
      ]),
    );
  }
}
