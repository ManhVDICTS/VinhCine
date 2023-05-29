import 'package:auto_route/auto_route.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:vinhcine/src/features/movie/presentation/views/widgets/movie_custom_controls.dart';

import '../../../../router/route_names.dart';

@RoutePage(name: moviePlayerScreenName)
class MoviePlayerScreen extends StatefulWidget {
  const MoviePlayerScreen({super.key, required this.videoPlayerController});

  final VideoPlayerController videoPlayerController;
  @override
  State<MoviePlayerScreen> createState() => _MoviePlayerScreenState();
}

class _MoviePlayerScreenState extends State<MoviePlayerScreen> {
  ChewieController? _chewieController;
  CustomMovieControls controls = const CustomMovieControls();
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      autoPlay: true,
      looping: true,
      showControls: true,
      autoInitialize: true,
      customControls: controls,
      placeholder: Container(
        color: Colors.black,
      ),
    );
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(children: [
          isVideoReady
              ? Chewie(
                  controller: _chewieController!,
                )
              : const SizedBox.shrink(),
        ]),
      ),
    );
  }

  bool get isVideoReady =>
      _chewieController != null &&
      _chewieController!.videoPlayerController.value.isInitialized;
}
