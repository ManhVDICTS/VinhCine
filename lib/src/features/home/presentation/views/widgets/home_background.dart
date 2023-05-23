import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/components/shadow/background_shadow.dart';

import '../../../../../core/di/injections.dart';
import '../../../../movie_tab/presentation/cubit/cubit.dart';

class HomeBackgroundShadow extends StatelessWidget {
  const HomeBackgroundShadow({super.key, this.isFill = true});
  final bool isFill;

  @override
  Widget build(BuildContext context) {
    return isFill
        ? const Positioned.fill(child: BackgroundShadow())
        : const BackgroundShadow();
  }
}

class HomeBackgroundSwitcher extends StatelessWidget {
  const HomeBackgroundSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieSelectorCubit>(
      create: (context) => di<MovieSelectorCubit>(),
      child: BlocBuilder<MovieSelectorCubit, MovieSelectorState>(
        builder: (context, state) {
          if (state is MovieSelectorSelected) {
            String imageUrl = state.movie.avatarUrl ?? '';
            return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                switchOutCurve: Curves.easeInOut,
                child: CachedNetworkImage(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  key: ValueKey(imageUrl),
                  fit: BoxFit.cover,
                  imageUrl: imageUrl,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
  // Widget _backgroundImage() {
  //   return Container(
  //       decoration: const BoxDecoration(
  //     image: DecorationImage(
  //       image: AssetImage("assets/images/poster_latmat6.jpg"),
  //       fit: BoxFit.cover,
  //     ),
  //   ));
  // }
