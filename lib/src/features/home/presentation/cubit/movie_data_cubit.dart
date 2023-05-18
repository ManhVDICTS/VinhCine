import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/features/home/domain/models/movie.dart';
import 'package:vinhcine/src/features/home/domain/repositories/movie_repository.dart';
import '../../domain/models/movie_tab.dart';

part 'movie_data_state.dart';

class MovieDataCubit extends Cubit<MovieDataState> {
  MovieDataCubit(this.repository) : super(MovieDataInitial());

  final MovieRepository repository;

  Future<void> getTopPage(MovieTab movieTab) async {
    emit(MovieDataLoading());
    final response = await repository.getTopPage(movieTab);
    response.fold((error) {
      emit(MovieDataFailure());
    }, (data) {
      emit(MovieDataLoaded(data));
    });
  }

}
