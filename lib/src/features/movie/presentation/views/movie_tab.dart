import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/features/movie/domain/models/movie_tab.dart';

import '../../../../core/di/injections.dart';
import '../../domain/models/movie.dart';
import '../cubit/cubit.dart';
import 'widgets/widgets.dart';

class MovieTab extends StatelessWidget {
  const MovieTab(
      {super.key,
      this.isExpanded = true,
      required this.width,
      required this.height,
      required this.initialTab,
      required this.onTapBooking,
      required this.onTapMovie});
  final double width;
  final double height;
  final bool isExpanded;
  final MovieTabType initialTab;
  final Function(MovieModel movie) onTapBooking;
  final Function(MovieModel movie) onTapMovie;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieTabCubit>(
          create: (context) => di<MovieTabCubit>()..onSelectedTab(initialTab),
        ),
        BlocProvider<MovieDataCubit>(
          create: (context) => di<MovieDataCubit>()..getTopPage(initialTab),
        ),
      ],
      child: Expanded(
        flex: isExpanded ? 1 : 0,
        child: _content(context),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<MovieTabCubit, MovieTabState>(
          builder: (context, state) => MovieTabTitle(
            selectedTab: state.selectedTab,
            onTabChanged: (movieTab) {
              context.read<MovieTabCubit>().onSelectedTab(movieTab);
            },
          ),
          listenWhen: (previous, current) =>
              previous != current && current is MovieTabSelected,
          listener: (context, state) =>
              context.read<MovieDataCubit>().getTopPage(state.selectedTab),
        ),
        BlocBuilder<MovieDataCubit, MovieDataState>(builder: (context, state) {
          if (state is MovieDataLoaded && state.data.isNotEmpty) {
            final data = state.data;
            final initialIndex = data.length ~/ 2;
            return MovieTabBody(
              initialIndex: initialIndex,
              data: data,
              options: MovieTabBodyOptions(
                onInited: (MovieModel initItem) =>
                    context.read<MovieSelectorCubit>().onSelected(initItem),
                onPageChanged: (MovieModel item) =>
                    context.read<MovieSelectorCubit>().onSelected(item),
                onPageTap: (MovieModel item) => onTapMovie.call(item),
              ),
            );
          } else {
            context.read<MovieSelectorCubit>().unSelected();
            return const Expanded(flex: 1, child: SizedBox.shrink());
          }
        }),
        BlocBuilder<MovieSelectorCubit, MovieSelectorState>(
            builder: (context, state) {
              if (state is MovieSelectorSelected) {
                return MovieTabBottom(
                  movie: state.movie,
                  onTapBooking: onTapBooking,
                );
              }
              return const SizedBox.shrink();
            })
      ],
    );
  }
}
