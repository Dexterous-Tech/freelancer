part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordTimerUpdated extends ForgetPasswordState {}

class ForgetPasswordTimerFinished extends ForgetPasswordState {}
