import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/features/home/presentation/cubit/movie_tab_cubit.dart';

import '../../../../components/button/text_button.dart';
import '../../domain/models/movie_tab.dart';

class MovieTabTitle extends StatelessWidget {
  const MovieTabTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabCubit, MovieTabState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: MovieTab.values
                .map((movieTab) => TextTabButton(
                      title: movieTab.title,
                      onTap: () {
                        context.read<MovieTabCubit>().onSelectedTab(movieTab);
                      },
                      selectedStatus: state.selectedTab == movieTab,
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
