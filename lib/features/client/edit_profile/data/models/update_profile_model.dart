import 'package:json_annotation/json_annotation.dart';
part 'update_profile_model.g.dart';

@JsonSerializable()
class UpdateProfileRequestBodyModel {
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'country_code')
  final String countryCode;
  final String phone;

  UpdateProfileRequestBodyModel({
    required this.firstName,
    required this.lastName,
    required this.countryCode,
    required this.phone,
  });

  factory UpdateProfileRequestBodyModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestBodyModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileRequestBodyModelToJson(this);
}

class VerificationUpdateProfile {
  final String phoneNumber;
  final String countryCode;
  final String oldPhoneNumber;
  final String oldCountryCode;
  final int needVerification;

  VerificationUpdateProfile({
    required this.phoneNumber,
    required this.countryCode,
    required this.needVerification,
    required this.oldCountryCode,
    required this.oldPhoneNumber,
  });
}
