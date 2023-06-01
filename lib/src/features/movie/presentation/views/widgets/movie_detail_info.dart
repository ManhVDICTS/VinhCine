import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vinhcine/src/core/utis/datetime.dart';
import 'package:vinhcine/src/features/movie/domain/models/movie.dart';

import '../../../../../configs/app_themes/app_themes.dart';

class MovieDetailInfo extends StatelessWidget {
  const MovieDetailInfo(
      {super.key, required this.movieData, this.avatarHeight = 150});
  final MovieModel movieData;
  final double avatarHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            // introduction
            SizedBox(
              height: avatarHeight,
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 3.0 / 4.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: movieData.avatarUrl ?? '',
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: avatarHeight / 2,
                            child: _buildTitle1(context)),
                        SizedBox(
                            height: avatarHeight / 2,
                            child: _buildTitle2(context)),
                      ],
                    ),
                  )
                ],
              ),
            )

            //
          ],
        )
      ],
    );
  }

  Widget _buildTitle1(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movieData.name ?? '',
            style: AppStyles.titleLargeRegular(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Container(
            height: 30,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage('assets/images/movie_type.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTitle2(BuildContext context) {
    AppColors? appColors = Theme.of(context).extension<AppColors>()!;
    final date = DateTimeUtil.formatDateToString(movieData.startDate);
    final duration = DateTimeUtil.durationToString(movieData.duration);
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              DateTimeTitle(
                text: date,
                icon: Icons.calendar_today,
              ),
              const SizedBox(width: 15),
              DateTimeTitle(
                text: duration,
                icon: Icons.av_timer,
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Icon(
                Icons.favorite_outline_sharp,
                size: 28,
                color: appColors.redDark,
              ),
              const SizedBox(width: 5),
              Text(
                '1000',
                style: AppStyles.titleSmallRegular(context)
                    .copyWith(color: appColors.backgroundDark),
              ),
              const SizedBox(width: 15),
              Icon(
                Icons.share,
                size: 28,
                color: appColors.redDark,
              )
            ],
          )
        ],
      ),
    );
  }
}

class DateTimeTitle extends StatelessWidget {
  const DateTimeTitle({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    AppColors? appColors = Theme.of(context).extension<AppColors>()!;
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: appColors.backgroundDark, width: 1)),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: AppStyles.titleSmallRegular(context)
                .copyWith(color: appColors.backgroundDark),
          )
        ],
      ),
    );
  }
}
