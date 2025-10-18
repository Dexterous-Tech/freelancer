import 'package:json_annotation/json_annotation.dart';
part 'verify_forget_model.g.dart';

@JsonSerializable()
class VerifyForgetRequestBodModel {
  @JsonKey(name: 'country_code')
  final String countryCode;
  final String phone;
  @JsonKey(name: 'otp_code')
  final String otpCode;

  VerifyForgetRequestBodModel({
    required this.countryCode,
    required this.phone,
    required this.otpCode,
  });

  factory VerifyForgetRequestBodModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyForgetRequestBodModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyForgetRequestBodModelToJson(this);
}
