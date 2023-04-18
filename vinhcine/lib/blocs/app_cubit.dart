import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinhcine/generated/l10n.dart';
import 'package:vinhcine/models/entities/token_entity.dart';
import 'package:vinhcine/models/entities/user_entity.dart';

import '../models/entities/index.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(WaitingForWarmingUp());
  late SharedPreferences prefs;

  void fetchData() async{
    var currentLocale = await getLanguageFromLocalStorage();
    emit(FetchedFullDataSuccessfully(token: TokenEntity(), user: UserEntity(), currentLocale: currentLocale));
  }

  void fetchAppLanguage() async{
    emit(WaitingForFetchingLanguage());
    ///Language
    var currentLocale = await getLanguageFromLocalStorage();
    emit(FetchedFullDataSuccessfully(currentLocale: currentLocale));
  }

  Future<Locale> getLanguageFromLocalStorage() async{
    prefs = await SharedPreferences.getInstance();
    ///Language
    String languageCode = prefs.getString('languageCode') ?? window.locale.languageCode;
    var locale = S.delegate.supportedLocales.firstWhere(
          (element) => element.languageCode == languageCode,
      orElse: () => Locale.fromSubtags(languageCode: 'en'),
    );
    return locale;
  }

  void updateLocale(Locale locale){
    prefs.setString('languageCode', locale.languageCode);
    emit(ChangedLanguageSuccessfully(currentLocale: locale));
  }

  // void updateToken(TokenEntity token) {
  //   emit(state.copyWith(token: token));
  // }
  //
  // void updateUser(TokenEntity token) {
  //   emit(state.copyWith(token: token));
  // }
}
