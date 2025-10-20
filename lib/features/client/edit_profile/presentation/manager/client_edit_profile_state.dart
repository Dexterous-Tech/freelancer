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
