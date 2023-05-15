import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/components/button/text_button.dart';
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
          final data = state.movie;
          return Container(
            color: Color(0xFF081012),
            padding: EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_info(data), _bookingButton(data)]),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _info(MovieModel movie) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        movie.name ?? '',
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 5),
      Text(
        DateTimeUtil.formatDurationAndCinemaDate(
            durationInMinutes: movie.duration, dateTime: movie.startDate),
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic),
      )
    ]);
  }
 
  Widget _bookingButton(MovieModel movie) {
    return CustomTextButton(
      border: Border.all(color: Colors.white, width: 1.5),
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      backgroundColor: Color(0xFFdb1b2a),
      textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      text: 'Đặt Vé',
      onTap: () {},
    );
  }
}
