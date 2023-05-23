import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vinhcine/src/components/button/text_button.dart';
import 'package:vinhcine/src/configs/app_themes/app_themes.dart';
import 'package:vinhcine/src/core/utis/datetime.dart';
import 'package:vinhcine/src/features/movie_tab/domain/models/movie.dart';

class MovieTabBottom extends StatelessWidget {
  const MovieTabBottom(
      {super.key, required this.movie, required this.onTapBooking});
  final Function(MovieModel movie) onTapBooking;
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>();
    return Container(
      color: appColors?.backgroundDark,
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        Expanded(flex: 1, child: _info(context)),
        Expanded(flex: 0, child: _bookingButton(context))
      ]),
    );
  }

  Widget _info(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        movie.name ?? '',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: AppStyles.titleMediumBold(context),
      ),
      Text(
        DateTimeUtil.formatDurationAndCinemaDate(
            durationInMinutes: movie.duration, dateTime: movie.startDate),
        style: AppStyles.titleMediumItalic(context),
      )
    ]);
  }

  Widget _bookingButton(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>();
    return CustomTextButton(
      border: Border.all(color: Colors.white, width: 1.5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      backgroundColor: appColors?.red,
      textStyle: AppStyles.titleMediumBold(context),
      text: 'home.button.booking'.tr(),
      onTap: onTapBooking.call(movie),
    );
  }
}
