import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vinhcine/models/entities/index.dart';
import 'package:vinhcine/models/entities/user_entity.dart';
import 'package:vinhcine/models/enums/load_status.dart';
import 'package:vinhcine/repositories/auth_repository.dart';
import 'package:vinhcine/utils/logger.dart';
import 'package:rxdart/rxdart.dart';

import '../../../models/entities/index.dart';
import '../../../models/entities/index.dart';

part 'splash_state.dart';

enum SplashNavigator {
  OPEN_HOME,
  OPEN_SIGN_IN,
}

class SplashCubit extends Cubit<SplashState> {
  AuthRepository repository;

  SplashCubit({required this.repository}) : super(WaitingForWarmingUp());

  void checkLogin() async {
    TokenEntity? token = await repository.getToken();
    if (token == null) {
      logger.d('emit LOGGED_OUT');
      emit(NeedToSignOut());
    } else {
      logger.d('emit LOGGED_IN');
      emit(NeedToGoHome());
    }
  }

  void getUser() {}

  void getRemoteConfig() {}

  @override
  Future<void> close() {
    return super.close();
  }
}
