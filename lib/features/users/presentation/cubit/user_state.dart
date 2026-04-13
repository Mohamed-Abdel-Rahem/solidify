part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UpdateSLider extends UserState {}

final class GetUserSuccessfully extends UserState {
  final UserEntity user;

  const GetUserSuccessfully({required this.user});

  @override
  List<Object> get props => [user];
}

final class GetUserLoading extends UserState {}

final class GetUserFailure extends UserState {
  final String errMessage;
  const GetUserFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
