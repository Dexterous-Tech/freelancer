part of 'verification_cubit.dart';

@immutable
sealed class VerificationState {}

final class VerificationInitial extends VerificationState {}

class VerificationLoading extends VerificationState {}

class VerificationFailure extends VerificationState {
  final String error;

  VerificationFailure(this.error);
}

class VerificationSuccess extends VerificationState {
  final AuthActionResponseModel success;

  VerificationSuccess(this.success);
}
