part of 'client_change_password_cubit.dart';

@immutable
sealed class ClientChangePasswordState {}

final class ClientChangePasswordInitial extends ClientChangePasswordState {}

final class ClientChangePasswordLoading extends ClientChangePasswordState {}

final class ClientChangePasswordFailure extends ClientChangePasswordState {
  final String error;

  ClientChangePasswordFailure(this.error);
}

final class ClientChangePasswordSuccess extends ClientChangePasswordState {
  final AuthActionResponseModel authActionResponseModel;

  ClientChangePasswordSuccess(this.authActionResponseModel);
}
