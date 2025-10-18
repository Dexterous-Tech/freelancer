import 'package:json_annotation/json_annotation.dart';
part 'forget_password_model.g.dart';

@JsonSerializable()
class ForgetPasswordRequestBodyModel {
  @JsonKey(name: 'country_code')
  final String countryCode;
  final String phone;

  ForgetPasswordRequestBodyModel({
    required this.countryCode,
    required this.phone,
  });
  factory ForgetPasswordRequestBodyModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordRequestBodyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestBodyModelToJson(this);
}
