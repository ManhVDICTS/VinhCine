import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinhcine/repositories/auth_repository.dart';

part 'setting_tab_state.dart';

class SettingTabCubit extends Cubit<SettingTabState> {
  SettingTabCubit({required this.repository}) : super(WaitingForWarmingUp());
  AuthRepository repository;
  late SharedPreferences prefs;

  void signOut() async {
    try {
      emit(WaitingForSigningOut());
      repository.removeToken();
      await Future.delayed(Duration(seconds: 2));
      emit(SignedOutSuccessfully());
    } on Exception catch (e) {
      ///todo do something here
    }
  }

  void updateLocale(Locale locale){
    emit(ChangedLanguageSuccessfully(currentLocale: locale));
  }
}
