part of 'movie_tab_cubit.dart';

abstract class MovieTabState extends Equatable {
  late final MovieTab _selectedTab;

  MovieTab get selectedTab => _selectedTab;

  @override
  List<Object> get props => [selectedTab];
}

class MovieTabInitial extends MovieTabState {}

class MovieTabSelected extends MovieTabState {
  @override
  final MovieTab selectedTab;

  MovieTabSelected(this.selectedTab);
}
