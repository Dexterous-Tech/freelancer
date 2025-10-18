part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

class VerifyForgetLoading extends ForgetPasswordState {}

class VerifyForgetFailure extends ForgetPasswordState {
  final String error;

  VerifyForgetFailure(this.error);
}

class VerifyForgetSuccess extends ForgetPasswordState {
  final AuthActionResponseModel forgetPasswordResponseModel;

  VerifyForgetSuccess(this.forgetPasswordResponseModel);
}
