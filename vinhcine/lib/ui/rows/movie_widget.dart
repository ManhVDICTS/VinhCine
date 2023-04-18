import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vinhcine/commons/app_colors.dart';
import 'package:vinhcine/models/entities/movie_entity.dart';

class MovieWidget extends StatelessWidget {
  MovieEntity? movie;
  VoidCallback? onPressed;

  MovieWidget({this.movie, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  _buildThumbWidget(),
                  SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      child: Text(movie?.title ?? '',
                          style: TextStyle(fontSize: 14, color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        ),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildThumbWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: AppColors.lightGray,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        child: CachedNetworkImage(
          imageUrl: movie?.posterUrl ?? '',
          fit: BoxFit.cover,
          width: 48,
          height: 48,
        ),
      ),
    );
  }
}
