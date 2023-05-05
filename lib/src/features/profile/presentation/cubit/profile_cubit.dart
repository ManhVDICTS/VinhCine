import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vinhcine/src/core/failures/failure.dart';
import 'package:vinhcine/src/core/shared_prefs/access_token_storage.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/features/profile/domain/repositories/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.repository) : super(ProfileInitial());

  final ProfileRepository repository;

  @override
  Future<void> close() {
    repository.cancelRequest();
    return super.close();
  }
}
