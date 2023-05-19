import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/components/button/text_button.dart';
import 'package:vinhcine/src/configs/app_themes/app_themes.dart';
import 'package:vinhcine/src/core/utis/datetime.dart';
import 'package:vinhcine/src/features/home/domain/models/movie.dart';
import 'package:vinhcine/src/features/home/presentation/cubit/movie_selector_cubit.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieSelectorCubit, MovieSelectorState>(
      buildWhen: (previous, current) => current is MovieSelectorSelected,
      builder: (context, state) {
        if (state is MovieSelectorSelected) {
          final appColors = Theme.of(context).extension<AppColors>();
          final data = state.movie;
          return Container(
            color: appColors?.backgroundDark,
            padding: EdgeInsets.all(10),
            child: Row(children: [
              Expanded(flex: 1, child: _info(context, data)),
              Expanded(flex: 0, child: _bookingButton(context, data))
            ]),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _info(BuildContext context, MovieModel movie) {
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

  Widget _bookingButton(BuildContext context, MovieModel movie) {
    final appColors = Theme.of(context).extension<AppColors>();
    return CustomTextButton(
      border: Border.all(color: Colors.white, width: 1.5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      backgroundColor: appColors?.red,
      textStyle: AppStyles.titleMediumBold(context),
      text: 'home.button.booking'.tr(),
      onTap: () {},
    );
  }
}
