import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vinhcine/src/components/appbar/custom_app_bar.dart';
import 'package:vinhcine/src/features/movie/domain/models/movie.dart';
import 'package:vinhcine/src/router/route_names.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../configs/app_themes/app_themes.dart';

@RoutePage(name: movieDetailScreenName)
class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.movieData});

  final MovieModel movieData;

  @override
  Widget build(BuildContext context) {
    return _content(context);
  }

  Widget _content(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>();
    String videoId =
        YoutubePlayer.convertUrlToId(movieData.trailerUrl ?? '') ?? '';
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        // loop: true,
        forceHD: true,
      ),
    );
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        onReady: () {
          log('movie onReady!');
        },
        onEnded: (data) {
          log('movie onEnded!');
        },
      ),
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: player,
              ),
              CustomAppBar(
                hasShadow: false,
                leadingIcon: Icon(Icons.arrow_back_outlined,
                    size: 32, color: appColors?.redDark),
                onPressedLeading: () {
                  context.popRoute();
                },
                title: movieData.name ?? '',
                titleStyle: AppStyles.titleLargeRegular(context)
                    .copyWith(color: Colors.black),
              ),
            ]),
          ),
        );
      },
    );
  }
}
