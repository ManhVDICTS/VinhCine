import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vinhcine/src/features/profile/domain/model/my_profile.dart';
import 'package:vinhcine/src/features/profile/domain/repositories/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.repository) : super(ProfileInitial());

  final ProfileRepository repository;

  Future<void> getMyProfile() async {
    emit(GetMyProfileLoading());
    final response = await repository.getMyProfile();
    response.fold((error) {
      emit(GetMyProfileFail());
    }, (data) {
      emit(GetMyProfileSuccess(profile: data));
    });
  }

  @override
  Future<void> close() {
    repository.cancelRequest();
    return super.close();
  }
}
