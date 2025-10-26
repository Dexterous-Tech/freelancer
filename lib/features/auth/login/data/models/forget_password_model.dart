import 'package:json_annotation/json_annotation.dart';
part 'forget_password_model.g.dart';

@JsonSerializable()
class ForgetPasswordRequestBodyModel {
  @JsonKey(name: 'country_code')
  final String countryCode;
  final String phone;

  @JsonKey(name: 'new_phone')
  final String? newPhone;
  @JsonKey(name: 'new_country_code')
  final String? newCountryCode;

  ForgetPasswordRequestBodyModel({
    required this.countryCode,
    required this.phone,
    this.newPhone,
    this.newCountryCode,
  });
  factory ForgetPasswordRequestBodyModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordRequestBodyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestBodyModelToJson(this);
}
