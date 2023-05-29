import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:vinhcine/src/components/appbar/custom_app_bar.dart';
import 'package:vinhcine/src/core/utis/context.dart';
import 'package:vinhcine/src/features/movie/domain/models/movie.dart';
import 'package:vinhcine/src/router/route_names.dart';
import 'package:vinhcine/src/router/router.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../../../configs/app_themes/app_themes.dart';

Stopwatch stopwatch = Stopwatch();

@RoutePage(name: movieDetailScreenName)
class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key, required this.movieData});

  final MovieModel movieData;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  VideoPlayerController? _videoPlayerController;

  String _videoUrl = '';
  String _thumbUrl = '';

  late AppColors? _appColors;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  Future<void> initPlayer() async {
    await _loadVideoInfoFromYouTubeLink(
      youtubeLink: widget.movieData.trailerUrl ?? '',
      onThumbLoaded: (thumbUrl) {
        setState(() {
          _thumbUrl = thumbUrl;
        });
      },
      onVideoUrlLoaded: (String videoUrl) {
        _videoUrl = videoUrl;
      },
    );
    await _initVideoController();
  }

  Future<void> _initVideoController() async {
    _videoPlayerController = VideoPlayerController.network(_videoUrl);
    await _videoPlayerController?.initialize();
  }

  @override
  Widget build(BuildContext context) {
    _appColors = Theme.of(context).extension<AppColors>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: AspectRatio(aspectRatio: 16 / 9, child: _buildThumbnail()),
        ),
        CustomAppBar(
          hasShadow: false,
          leadingIcon: Icon(Icons.arrow_back_outlined,
              size: 32, color: _appColors?.redDark),
          onPressedLeading: () {
            context.popRoute();
          },
          title: 'Movie',
          titleStyle: AppStyles.titleLargeRegular(context)
              .copyWith(color: Colors.black),
        ),
      ]),
    );
  }

  Widget _buildThumbnail() {
    return _thumbUrl.isNotEmpty
        ? GestureDetector(
            onTap: () {
              if (_videoPlayerController?.value.isInitialized == true) {
                context.pushRoute(MoviePlayerScreenRoute(
                    videoController: _videoPlayerController!));
              }
            },
            child: Stack(
              children: [
                CachedNetworkImage(
                  width: context.screenWidth,
                  fit: BoxFit.cover,
                  imageUrl: _thumbUrl,
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(Icons.play_arrow,
                        size: 32, color: Colors.white),
                  ),
                )
              ],
            ),
          )
        : Container(
            color: Colors.black,
            child: Center(
                child:
                    CircularProgressIndicator(color: _appColors?.redDark)));
  }

  Future<void> _loadVideoInfoFromYouTubeLink(
      {required String youtubeLink,
      required Function(String thumbUrl) onThumbLoaded,
      required Function(String videoUrl) onVideoUrlLoaded}) async {
    final yt = YoutubeExplode();
    try {
      var video = await yt.videos.get(youtubeLink);
      var videoId = video.id;
      onThumbLoaded.call(video.thumbnails.standardResUrl);
      log('Video id: $videoId');
      log('Video thumbUrl: $_thumbUrl');

      final streamManifest = await yt.videos.streamsClient.getManifest(videoId);
      final streamInfo = streamManifest.muxed.withHighestBitrate();
      log('streamInfo.url: ${streamInfo.url.toString()}');
      onVideoUrlLoaded.call(streamInfo.url.toString());
    } finally {
      yt.close();
    }
  }
}
