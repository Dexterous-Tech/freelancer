import 'package:json_annotation/json_annotation.dart';
part 'signup_models.g.dart';

@JsonSerializable()
class SignupRequestBodyModel {
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'country_code')
  final String countryCode;
  final String phone;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;

  SignupRequestBodyModel({
    required this.firstName,
    required this.lastName,
    required this.countryCode,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
  });

  factory SignupRequestBodyModel.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestBodyModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestBodyModelToJson(this);
}
