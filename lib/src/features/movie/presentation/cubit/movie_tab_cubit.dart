import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/features/movie/domain/models/movie_tab.dart';

part 'movie_tab_state.dart';

class MovieTabCubit extends Cubit<MovieTabState> {
  MovieTabCubit() : super(MovieTabInitial());

  void onSelectedTab(MovieTabType movieTab) {
    emit(MovieTabSelected(movieTab));
  }
}
