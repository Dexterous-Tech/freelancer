part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLogoutLoading extends ProfileState {}

final class ProfileLogoutFailure extends ProfileState {
  final String error;

  ProfileLogoutFailure(this.error);
}

final class ProfileLogoutSuccess extends ProfileState {
  final AuthActionResponseModel authActionResponseModel;

  ProfileLogoutSuccess(this.authActionResponseModel);
}
