import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MoviesCarousel extends StatefulWidget {
  MoviesCarousel(
      {super.key,
      required this.imgList,
      required this.width,
      required this.height,
      required this.currentIndex});
  final List<String> imgList;
  final double width;
  final double height;
  int currentIndex;

  @override
  State<MoviesCarousel> createState() => _MoviesCarouselState();
}

class _MoviesCarouselState extends State<MoviesCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.imgList.length,
      itemBuilder: (ctx, itemIndex, pageViewIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            width: 300,
            height: 400,
            fit: BoxFit.cover,
            imageUrl: widget.imgList[itemIndex],
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      },
      options: CarouselOptions(
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        height: 400,
        initialPage: widget.currentIndex,
        viewportFraction: 0.75,
        onScrolled: (value) {},
        onPageChanged: (index, reason) {
          setState(() {
            widget.currentIndex = index;
          });
        },
      ),
    );
  }
}
