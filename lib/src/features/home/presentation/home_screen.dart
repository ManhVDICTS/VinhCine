import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/components/button/icon_button.dart';
import 'package:vinhcine/src/features/banner/presentation/views/banner.dart';
import 'package:vinhcine/src/features/home/domain/models/movie.dart';
import 'package:vinhcine/src/features/home/presentation/widgets/cinema_direction.dart';
import 'package:vinhcine/src/features/home/presentation/widgets/movie_info.dart';
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
          BlocProvider<MovieDataCubit>(
              create: (context) => di<MovieDataCubit>()..getTopPage()),
          BlocProvider(
            create: (context) => di<MovieSelectorCubit>(),
          ),
        ],
        child: MultiBlocListener(listeners: [
          BlocListener<MovieDataCubit, MovieDataState>(
              listener: (context, state) {
            if (state is MovieDataLoaded && state.data.isNotEmpty) {
              int initialIndex = (state.data.length / 2).round();
              MovieModel data = state.data[initialIndex];
              context.read<MovieSelectorCubit>().onSelected(initialIndex, data);
            } else if (state is MovieDataFailure) {
              context.read<MovieSelectorCubit>().unSelected();
            }
          })
        ], child: this));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      _backgroundMovieSwitcher(),
      _backgroundShadow(),
      _body(context),
      _appBar(context)
    ]));
  }

  Widget _backgroundShadow() {
    return const Positioned.fill(
      child: HomeBackgroundShadow(),
    );
  }

  Widget _backgroundMovieSwitcher() {
    return const HomeBackgroundSwitcher();
  }

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
                'Vinh Cine',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
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
        Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Đang Chiếu',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                'Đặc Biệt',
                style: TextStyle(color: Color(0xFFcccdcd), fontSize: 16),
              ),
              Text(
                'Sắp Chiếu',
                style: TextStyle(color: Color(0xFFcccdcd), fontSize: 16),
              )
            ],
          ),
        ),
        const Expanded(child: MoviesCarousel(width: 300, height: 400)),
        MovieInfo(),
        CinemaDirection()
      ]),
    );
  }

}

extension ContextUtils on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  TextStyle get headline1 => textTheme.headline1!;
  TextStyle get headline2 => textTheme.headline2!;
  TextStyle get headline3 => textTheme.headline3!;
  TextStyle get headline4 => textTheme.headline4!;
  TextStyle get headline5 => textTheme.headline5!;
  TextStyle get headline6 => textTheme.headline6!;
  TextStyle get bodyText1 => textTheme.bodyText1!;
  TextStyle get bodyText2 => textTheme.bodyText2!;
}
