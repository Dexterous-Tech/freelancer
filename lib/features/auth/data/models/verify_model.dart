import 'package:json_annotation/json_annotation.dart';
part 'verify_model.g.dart';

@JsonSerializable()
class VerifyRequestBodModel {
  @JsonKey(name: 'country_code')
  final String countryCode;
  final String phone;
  @JsonKey(name: 'otp_code')
  final String otpCode;

  VerifyRequestBodModel({
    required this.countryCode,
    required this.phone,
    required this.otpCode,
  });

  factory VerifyRequestBodModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyRequestBodModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyRequestBodModelToJson(this);
}
