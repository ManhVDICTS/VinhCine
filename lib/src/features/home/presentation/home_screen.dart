import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vinhcine/src/components/button/icon_button.dart';
import 'package:vinhcine/src/components/button/text_button.dart';
import 'package:vinhcine/src/features/banner/presentation/widgets/banner.dart';
import 'package:vinhcine/src/features/home/presentation/widgets/cinema_direction.dart';
import 'package:vinhcine/src/features/home/presentation/widgets/movies_carousel.dart';
import 'package:vinhcine/src/router/route_names.dart';

final List<String> moviesList = [
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/7/0/700x1000_2_.jpg',
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/p/o/poster_gttdy_1.jpg',
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/l/m/lm6_2x3_layout.jpg',
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/7/0/700x1000-tid-noi.jpg',
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/g/h/ghost-station_main_fin_viethoa.jpg',
  'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/7/0/700x1000_4_.jpg'
];

final List<String> bannerList = [
  'http://api.vinhcine.vn/files/ffb5b1964e09ef4c5db15831e932629d.jpeg',
  'http://api.vinhcine.vn/files/8aa0840df3e926cfc757d3e426c71ab8.jpeg',
];

@RoutePage(name: homeScreenName)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _indexCarousel;
  late double _appBarHeight;

  @override
  void initState() {
    super.initState();
    _appBarHeight = 48;
    _indexCarousel = (moviesList.length / 2).round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      _backgroundAnimation(),
      _backgroundShadow(),
      _body(),
      _appBar()
    ]));
  }

  Widget _backgroundShadow() {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.5, 0.7, 1],
            colors: [
              Color.fromRGBO(0, 0, 0, 0.6),
              Color.fromRGBO(0, 0, 0, 0.45),
              Color.fromRGBO(0, 0, 0, 0.3),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() => SafeArea(
        child: Container(
          height: _appBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                icon: const Icon(Icons.account_circle,
                    size: 32, color: Colors.white),
                onTap: () {},
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
                onTap: () {},
              ),
            ],
          ),
        ),
      );

  Widget _body() {
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
        Expanded(
            child: MoviesCarousel(
                imgList: moviesList,
                width: 300,
                height: 400,
                currentIndex: _indexCarousel)),
        Container(
          color: Color(0xFF081012),
          padding: EdgeInsets.all(10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'LẬT MẶT 6',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                '1giờ 52phút 28 Thg 4, 2023',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.italic),
              )
            ]),
            BookingButton()
          ]),
        ),
        CinemaDirection()
      ]),
    );
  }

  Widget _backgroundAnimation() {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchOutCurve: Curves.easeInOut,
        child: CachedNetworkImage(
          width: double.maxFinite,
          height: double.maxFinite,
          key: ValueKey(_indexCarousel),
          fit: BoxFit.cover,
          imageUrl: moviesList[_indexCarousel],
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ));
  }

  Widget _backgroundImage() {
    return Container(
        decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/poster_latmat6.jpg"),
        fit: BoxFit.cover,
      ),
    ));
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
