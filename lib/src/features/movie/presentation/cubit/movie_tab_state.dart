part of 'movie_tab_cubit.dart';

abstract class MovieTabState extends Equatable {
  late final MovieTabType _selectedTab;

  MovieTabType get selectedTab => _selectedTab;

  @override
  List<Object> get props => [selectedTab];
}

class MovieTabInitial extends MovieTabState {}

class MovieTabSelected extends MovieTabState {
  @override
  final MovieTabType selectedTab;

  MovieTabSelected(this.selectedTab);
}
