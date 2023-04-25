import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vinhcine/src/features/detail/domain/models/genre.dart';

import '../../domain/repositories/movie_repository.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit(this.movieRepository) : super(DetailInitial());

  final MovieGenreRepository movieRepository;

  Future<void> getMovieGenres() async {
    emit(DetailLoading());

    final response = await movieRepository.getMovieGenres();
    response.fold((error) {
      emit(DetailFailed());
    }, (data) {
      emit(DetailSuccess(data));
    });
  }
}
