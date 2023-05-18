import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial(isDark: false));

  void updateTheme(bool value) {
    emit(ThemeChanged(isDark: value));
  }
}
