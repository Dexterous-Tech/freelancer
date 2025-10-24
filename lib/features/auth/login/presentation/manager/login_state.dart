part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final ApiErrorModel error;

  LoginFailure(this.error);
}

final class LoginSuccess extends LoginState {
  final LoginResponseModel loginResponseModel;

  LoginSuccess(this.loginResponseModel);
}

final class ForgetPasswordLoading extends LoginState {}

final class ForgetPasswordFailure extends LoginState {
  final ApiErrorModel error;

  ForgetPasswordFailure(this.error);
}

final class ForgetPasswordSuccess extends LoginState {
  final AuthActionResponseModel forgetPasswordResponseModel;

  ForgetPasswordSuccess(this.forgetPasswordResponseModel);
}
