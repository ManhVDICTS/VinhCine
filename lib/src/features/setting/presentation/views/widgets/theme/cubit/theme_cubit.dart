import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:vinhcine/src/core/global/global_event.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial(themeMode: ThemeMode.light));

  void updateTheme(ThemeMode mode) {
    GlobalEvent.instance.refreshThemeEvent.add(mode);
    emit(ThemeChanged(themeMode: mode));
  }
}
