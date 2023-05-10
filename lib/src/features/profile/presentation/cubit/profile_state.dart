// ignore_for_file: must_be_immutable

part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetMyProfileLoading extends ProfileState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetMyProfileFail extends ProfileState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetMyProfileSuccess extends ProfileState {
  MyProfile profile;

  GetMyProfileSuccess({required this.profile});

  @override
  List<Object?> get props => [profile];
}
