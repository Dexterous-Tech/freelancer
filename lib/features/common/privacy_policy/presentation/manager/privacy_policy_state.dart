part of 'privacy_policy_cubit.dart';

@immutable
sealed class PrivacyPolicyState {}

final class PrivacyPolicyInitial extends PrivacyPolicyState {}

final class PrivacyPolicyLoading extends PrivacyPolicyState {}

final class PrivacyPolicyFailure extends PrivacyPolicyState {
  final String error;

  PrivacyPolicyFailure(this.error);
}

final class PrivacyPolicySuccess extends PrivacyPolicyState {
  final SettingsResponseModel settingsResponseModel;

  PrivacyPolicySuccess(this.settingsResponseModel);
}
