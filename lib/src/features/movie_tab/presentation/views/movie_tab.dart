import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/features/movie_tab/domain/models/movie_tab.dart';

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
      required this.onTapBooking});
  final double width;
  final double height;
  final bool isExpanded;
  final MovieTabType initialTab;
  final Function(MovieModel movie) onTapBooking;

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
        BlocProvider(
          create: (context) => di<MovieSelectorCubit>(),
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
          builder: (context, state) {
            return MovieTabTitle(
              selectedTab: state.selectedTab,
              onTabChanged: (movieTab) {
                context.read<MovieTabCubit>().onSelectedTab(movieTab);
              },
            );
          },
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            if (state is MovieTabSelected) {
              context.read<MovieDataCubit>().getTopPage(state.selectedTab);
            }
          },
        ),
        BlocBuilder<MovieDataCubit, MovieDataState>(builder: (context, state) {
          if (state is MovieDataLoaded) {
            final data = state.data;
            final initialIndex = data.length ~/ 2;
            return MovieTabBody(
              initialIndex: initialIndex,
              data: data,
              options: MovieTabBodyOptions(
                onInited: (MovieModel initItem) {
                  context.read<MovieSelectorCubit>().onSelected(initItem);
                },
                onPageChanged: (MovieModel item) {
                  context.read<MovieSelectorCubit>().onSelected(item);
                },
              ),
            );
          } else {
            return const Expanded(flex: 1, child: SizedBox.shrink());
          }
        }),
        BlocBuilder<MovieSelectorCubit, MovieSelectorState>(
            buildWhen: (previous, current) => current is MovieSelectorSelected,
            builder: (context, state) {
              if (state is MovieSelectorSelected) {
                return MovieTabBottom(
                  movie: state.movie,
                  onTapBooking: onTapBooking,
                );
              } else {
                return const SizedBox.shrink();
              }
            })
      ],
    );
  }
}
