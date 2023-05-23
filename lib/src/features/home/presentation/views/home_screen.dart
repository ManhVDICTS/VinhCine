import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vinhcine/src/components/button/icon_button.dart';
import 'package:vinhcine/src/configs/app_themes/app_themes.dart';
import 'package:vinhcine/src/features/banner/presentation/views/banner.dart';
import 'package:vinhcine/src/features/movie_tab/domain/models/movie.dart';
import 'package:vinhcine/src/features/movie_tab/domain/models/movie_tab.dart';
import 'package:vinhcine/src/features/movie_tab/presentation/views/movie_tab.dart';
import 'package:vinhcine/src/router/route_names.dart';
import 'package:vinhcine/src/router/router.dart';

import 'widgets/background.dart';
import 'widgets/cinema_direction.dart';


final List<String> moviesList = [
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/7/0/700x1000_2_.jpg',
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/p/o/poster_gttdy_1.jpg',
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/l/m/lm6_2x3_layout.jpg',
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/7/0/700x1000-tid-noi.jpg',
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/g/h/ghost-station_main_fin_viethoa.jpg',
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/7/0/700x1000_4_.jpg'
];

@RoutePage(name: homeScreenName)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final double _appBarHeight = 48;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      const HomeBackgroundSwitcher(),
      const HomeBackgroundShadow(),
      _body(context),
      _appBar(context)
    ]));
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
        MovieTab(
          width: 300,
          height: 400,
          initialTab: MovieTabType.now,
          onTapBooking: (MovieModel movie) {
            // booking movie
          },
        ),
        const CinemaDirection()
      ]),
    );
  }
}
