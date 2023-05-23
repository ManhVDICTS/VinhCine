part of 'movie_selector_cubit.dart';

abstract class MovieSelectorState extends Equatable {
  const MovieSelectorState();

  @override
  List<Object> get props => [];
}

class MovieSelectorInitial extends MovieSelectorState {}

class MovieSelectorSelected extends MovieSelectorState {
  final MovieModel movie;

  const MovieSelectorSelected(this.movie);

  @override
  List<Object> get props => [movie];
}

class MovieSelectorUnSelected extends MovieSelectorState {}
