import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vinhcine/src/features/movie_tab/domain/models/movie.dart';

class MovieTabBodyOptions {
  final double width;
  final double height;
  final bool isExpanded;
  final Function(MovieModel item) onPageChanged;
  final Function(MovieModel initItem) onInited;

  MovieTabBodyOptions(
      {this.width = 300,
      this.height = 400,
      this.isExpanded = true,
      required this.onPageChanged,
      required this.onInited});
}

class MovieTabBody extends StatelessWidget {
  const MovieTabBody({
    super.key,
    required this.data,
    required this.options,
    this.initialIndex = 0,
  });
  final List<MovieModel> data;
  final int initialIndex;
  final MovieTabBodyOptions options;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: (options.isExpanded ? 1 : 0),
      child: _carouselWidget(data: data, initialIndex: initialIndex),
    );
  }

  Widget _carouselWidget(
      {required List<MovieModel> data, required int initialIndex}) {
    options.onInited.call(data[initialIndex]);
    return CarouselSlider.builder(
      itemCount: data.length,
      itemBuilder: (ctx, itemIndex, pageViewIndex) =>
          _itemWidget(imageUrl: data[itemIndex].avatarUrl ?? ''),
      options: _carouselOptions(
          initialIndex: initialIndex,
          enableInfiniteScroll: data.length > 2,
          onPagedChanged: (index) => options.onPageChanged.call(data[index])),
    );
  }

  Widget _itemWidget({required String imageUrl}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        width: options.width,
        height: options.height,
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  CarouselOptions _carouselOptions(
      {required int initialIndex,
      required bool enableInfiniteScroll,
      required Function(int) onPagedChanged}) {
    return CarouselOptions(
      enlargeCenterPage: true,
      enlargeStrategy: CenterPageEnlargeStrategy.height,
      enableInfiniteScroll: enableInfiniteScroll,
      height: options.height,
      initialPage: initialIndex,
      viewportFraction: 0.75,
      onPageChanged: (index, reason) {
        onPagedChanged.call(index);
      },
    );
  }
}
