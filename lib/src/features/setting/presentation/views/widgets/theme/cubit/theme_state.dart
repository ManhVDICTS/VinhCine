part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  ThemeState({required this.isDark});

  bool isDark;

  @override
  List<Object> get props => [isDark];
}

// ignore: must_be_immutable
class ThemeInitial extends ThemeState {
  ThemeInitial({required super.isDark});

  @override
  List<Object> get props => [isDark];
}

// ignore: must_be_immutable
class ThemeChanged extends ThemeState {
  ThemeChanged({required super.isDark});

  @override
  List<Object> get props => [isDark];
}

