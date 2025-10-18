import 'package:json_annotation/json_annotation.dart';
part 'new_password_model.g.dart';

@JsonSerializable()
class NewPasswordRequestBodyModel {
  @JsonKey(name: 'country_code')
  final String countryCode;
  final String phone;
  @JsonKey(name: 'new_password')
  final String newPassword;
  @JsonKey(name: 'new_password_confirmation')
  final String newPasswordConfirmation;

  NewPasswordRequestBodyModel({
    required this.countryCode,
    required this.phone,
    required this.newPassword,
    required this.newPasswordConfirmation,
  });

  factory NewPasswordRequestBodyModel.fromJson(Map<String, dynamic> json) =>
      _$NewPasswordRequestBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewPasswordRequestBodyModelToJson(this);
}
