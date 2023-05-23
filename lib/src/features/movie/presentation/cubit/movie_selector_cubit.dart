import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/features/movie/domain/models/movie.dart';

part 'movie_selector_state.dart';

class MovieSelectorCubit extends Cubit<MovieSelectorState> {
  MovieSelectorCubit() : super(MovieSelectorInitial());

  void onSelected(MovieModel movie) {
    emit(MovieSelectorSelected(movie));
  }

  void unSelected() {
    emit(MovieSelectorUnSelected());
  }
}
