import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vinhcine/src/core/failures/failure.dart';
import 'package:vinhcine/src/core/shared_prefs/access_token_storage.dart';
import 'package:vinhcine/src/features/authentication/domain/model/register.dart';
import '../../domain/repositories/auth_repository.dart';
import 'package:vinhcine/src/core/di/injections.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.repository) : super(SignInInitial());

  final AuthRepository repository;

  Future<void> signIn(String username, String password) async {
    emit(SignInLoading());
    final response =
        await repository.signIn(userName: username, password: password);
    response.fold((error) {
      emit(SignInFail());
    }, (data) {
      di<AccessTokenStorage>().write(data);
      emit(SignInSuccess(token: data));
    });
  }

  void initData() async {
    var token = await di<AccessTokenStorage>().read();
    emit(GetTokenSuccess(token: token ?? ''));
  }

  bool checkUserName(String userName) {
    bool valid = userName.isNotEmpty;
    if (!valid) {
      emit(UserNameInvalid());
    }
    return valid;
  }

  bool checkPassword(String password) {
    bool valid = password.isNotEmpty;
    if (!valid) {
      emit(PasswordInvalid());
    }
    return valid;
  }

  bool checkFullName(String fullName) {
    bool valid = fullName.isNotEmpty;
    if (!valid) {
      emit(FullNameInvalid());
    }
    return valid;
  }

  bool checkPhone(String phone) {
    bool valid = phone.isNotEmpty;
    if (!valid) {
      emit(PhoneInvalid());
    }
    return valid;
  }

  bool checkEmail(String email) {
    bool valid = email.isNotEmpty;
    if (!valid) {
      emit(EmailInvalid());
    }
    return valid;
  }

  Future<void> signOut() async {
    emit(SignOutLoading());
    final response = await repository.signOut();
    response.fold((error) {
      emit(SignOutFail());
    }, (data) {
      di<AccessTokenStorage>().delete();
      emit(SignOutSuccess());
    });
  }

  Future<void> register({
    required String userName,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    emit(RegisterLoading());
    final response = await repository.register(
        userName: userName,
        password: password,
        fullName: fullName,
        phone: phone);
    response.fold((error) {
      emit(RegisterFail());
    }, (data) {
      emit(RegisterSuccess(data));
    });
  }

  Future<void> forgotPassword(String userName) async {
    emit(ForgotPasswordLoading());
    final response = await repository.forgotPassword(userName: userName);
    response.fold((error) {
      if (error is DetailFailure) {
        emit(ForgotPasswordFail(message: error.message ?? ''));
      } else {
        emit(ForgotPasswordFail(message: 'something wrong, unknown error'));
      }
    }, (data) {
      emit(ForgotPasswordSuccess());
    });
  }

  @override
  Future<void> close() {
    repository.cancelRequest();
    return super.close();
  }
}
