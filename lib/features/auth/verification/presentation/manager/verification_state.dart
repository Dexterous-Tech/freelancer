part of 'verification_cubit.dart';

@immutable
sealed class VerificationState {}

final class VerificationInitial extends VerificationState {}

class VerificationTimerUpdated extends VerificationState {}

class VerificationTimerFinished extends VerificationState {}
