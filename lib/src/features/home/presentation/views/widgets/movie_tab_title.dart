import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/components/button/text_button.dart';
import 'package:vinhcine/src/features/home/domain/models/movie_tab.dart';
import 'package:vinhcine/src/features/home/presentation/cubit/movie_tab_cubit.dart';

class MovieTabTitle extends StatelessWidget {
  const MovieTabTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabCubit, MovieTabState>(
      builder: (context, state) => Container(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _moviesTabData(context, state.selectedTab),
        ),
      ),
    );
  }

  List<Widget> _moviesTabData(BuildContext context, MovieTab selectedTab) {
    return MovieTab.values
        .map((movieTab) => _moviesTabItem(
              title: movieTab.title,
              selectedStatus: selectedTab == movieTab,
              onTap: () {
                context.read<MovieTabCubit>().onSelectedTab(movieTab);
              },
            ))
        .toList();
  }

  Widget _moviesTabItem(
      {required String title,
      required bool selectedStatus,
      required VoidCallback onTap}) {
    return TextTabButton(
      title: title,
      onTap: onTap,
      selectedStatus: selectedStatus,
    );
  }
}
