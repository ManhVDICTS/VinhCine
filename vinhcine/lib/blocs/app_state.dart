part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  final TokenEntity? token;
  final UserEntity? user;
  Locale? currentLocale;

  AppState({
    this.token,
    this.user,
    this.currentLocale,
  });

  @override
  List<Object> get props => [
    token ?? TokenEntity(token: "", refreshToken: ""),
    user ?? UserEntity(),
    currentLocale ?? Locale.fromSubtags(languageCode: 'vi'),
  ];
}

// ignore: must_be_immutable
class WaitingForWarmingUp extends AppState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class FetchedFullDataSuccessfully extends AppState {
  FetchedFullDataSuccessfully({
    super.token,
    super.user,
    super.currentLocale,
  });

  @override
  List<Object> get props => super.props;
}

// ignore: must_be_immutable
class WaitingForFetchingLanguage extends AppState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class FetchedLanguageSuccessfully extends AppState {
  FetchedLanguageSuccessfully({
    super.currentLocale,
  });

  @override
  List<Object> get props => [
    currentLocale ?? Locale.fromSubtags(languageCode: 'vi'),
  ];
}

// ignore: must_be_immutable
class WaitingForChangingLanguage extends AppState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ChangedLanguageSuccessfully extends AppState {
  ChangedLanguageSuccessfully({super.currentLocale});

  @override
  List<Object> get props => [
    currentLocale ?? Locale.fromSubtags(languageCode: 'vi'),
  ];
}