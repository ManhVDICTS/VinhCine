import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/features/home/presentation/cubit/movie_data_cubit.dart';
import 'package:vinhcine/src/features/home/presentation/cubit/movie_selector_cubit.dart';

class MoviesCarousel extends StatelessWidget {
  const MoviesCarousel({super.key, required this.width, required this.height});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDataCubit, MovieDataState>(
        builder: (context, state) {
      if (state is MovieDataLoaded) {
        final data = state.data;
        final int initialIndex = state.data.length ~/ 2;
        context.read<MovieSelectorCubit>().onSelected(data[initialIndex]);
        return CarouselSlider.builder(
          itemCount: data.length,
          itemBuilder: (ctx, itemIndex, pageViewIndex) =>
              _carouselItemBuilder(imageUrl: data[itemIndex].avatarUrl ?? ''),
          options: _getCarouselOptions(
              initialIndex: initialIndex,
              enableInfiniteScroll: data.length > 2,
              onPagedChanged: (index) => context
                  .read<MovieSelectorCubit>()
                  .onSelected(data[index])),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }

  Widget _carouselItemBuilder({required String imageUrl}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        width: width,
        height: height,
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  CarouselOptions _getCarouselOptions(
      {required int initialIndex,
      required bool enableInfiniteScroll,
      required Function(int) onPagedChanged}) {
    return CarouselOptions(
      enlargeCenterPage: true,
      enlargeStrategy: CenterPageEnlargeStrategy.height,
      enableInfiniteScroll: enableInfiniteScroll,
      height: height,
      initialPage: initialIndex,
      viewportFraction: 0.75,
      onPageChanged: (index, reason) {
        onPagedChanged.call(index);
      },
    );
  }
}
