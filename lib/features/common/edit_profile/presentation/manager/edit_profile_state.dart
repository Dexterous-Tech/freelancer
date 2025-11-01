part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileLoading extends EditProfileState {}

final class EditProfileFailure extends EditProfileState {
  final String error;

  EditProfileFailure(this.error);
}

final class EditProfileSuccess extends EditProfileState {
  final ProfileResponseModel profileResponseModel;

  EditProfileSuccess(this.profileResponseModel);
}

final class ProfileChangeVisiblePassword extends EditProfileState {}

final class ProfileDeleteAccountLoading extends EditProfileState {}

final class ProfileDeleteAccountFailure extends EditProfileState {
  final String error;

  ProfileDeleteAccountFailure(this.error);
}

final class ProfileDeleteAccountSuccess extends EditProfileState {
  final AuthActionResponseModel authActionResponseModel;

  ProfileDeleteAccountSuccess(this.authActionResponseModel);
}
