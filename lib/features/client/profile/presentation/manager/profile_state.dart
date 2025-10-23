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

final class ProfileDeleteAccountLoading extends ProfileState {}

final class ProfileDeleteAccountFailure extends ProfileState {
  final String error;

  ProfileDeleteAccountFailure(this.error);
}

final class ProfileDeleteAccountSuccess extends ProfileState {
  final AuthActionResponseModel authActionResponseModel;

  ProfileDeleteAccountSuccess(this.authActionResponseModel);
}

final class ProfileGetProfileLoading extends ProfileState {}

final class ProfileGetProfileFailure extends ProfileState {
  final String error;

  ProfileGetProfileFailure(this.error);
}

final class ProfileGetProfileSuccess extends ProfileState {
  final ProfileResponseModel profileResponseModel;

  ProfileGetProfileSuccess(this.profileResponseModel);
}

final class ProfileChangeVisiblePassword extends ProfileState {}
