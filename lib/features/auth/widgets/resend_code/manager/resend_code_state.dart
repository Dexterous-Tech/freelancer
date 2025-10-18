part of 'resend_code_cubit.dart';

@immutable
sealed class ResendCodeState {}

final class ResendCodeInitial extends ResendCodeState {}

final class ResendCodeTimerUpdated extends ResendCodeState {}

final class ResendCodeTimerFinished extends ResendCodeState {}

final class ResendCodeLoading extends ResendCodeState {}

final class ResendCodeFailure extends ResendCodeState {
  final String error;

  ResendCodeFailure(this.error);
}

final class ResendCodeSuccess extends ResendCodeState {
  final AuthActionResponseModel forgetPasswordResponseModel;

  ResendCodeSuccess(this.forgetPasswordResponseModel);
}
