part of 'detail_cubit.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailSuccess extends DetailState {
  const DetailSuccess(this.data);
  final List<GenreModel> data;

  @override
  List<Object> get props => [data];
}

class DetailFailed extends DetailState {}
