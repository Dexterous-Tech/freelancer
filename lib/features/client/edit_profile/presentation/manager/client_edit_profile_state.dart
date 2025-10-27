part of 'client_edit_profile_cubit.dart';

@immutable
sealed class ClientEditProfileState {}

final class ClientEditProfileInitial extends ClientEditProfileState {}

final class ClientEditProfileLoading extends ClientEditProfileState {}

final class ClientEditProfileFailure extends ClientEditProfileState {
  final String error;

  ClientEditProfileFailure(this.error);
}

final class ClientEditProfileSuccess extends ClientEditProfileState {
  final ProfileResponseModel profileResponseModel;

  ClientEditProfileSuccess(this.profileResponseModel);
}

final class ProfileChangeVisiblePassword extends ClientEditProfileState {}

final class ProfileDeleteAccountLoading extends ClientEditProfileState {}

final class ProfileDeleteAccountFailure extends ClientEditProfileState {
  final String error;

  ProfileDeleteAccountFailure(this.error);
}

final class ProfileDeleteAccountSuccess extends ClientEditProfileState {
  final AuthActionResponseModel authActionResponseModel;

  ProfileDeleteAccountSuccess(this.authActionResponseModel);
}
