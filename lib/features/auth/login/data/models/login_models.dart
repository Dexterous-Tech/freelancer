import 'package:json_annotation/json_annotation.dart';
part 'login_models.g.dart';

@JsonSerializable()
class LoginRequestBodyModel {
  @JsonKey(name: 'country_code')
  final String countryCode;
  final String phone;
  final String password;

  LoginRequestBodyModel({
    required this.countryCode,
    required this.phone,
    required this.password,
  });

  factory LoginRequestBodyModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestBodyModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestBodyModelToJson(this);
}

@JsonSerializable()
class LoginResponseModel {
  final String message;
  final String type;
  final int status;
  final bool showToast;
  final LoginResponseData? data;

  LoginResponseModel({
    required this.message,
    required this.type,
    required this.status,
    required this.showToast,
    this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class LoginResponseData {
  final String token;
  final LoginResponseUserData? user;

  LoginResponseData({required this.token, this.user});

  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDataToJson(this);
}

@JsonSerializable()
class LoginResponseUserData {
  final int id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'country_code')
  final String countryCode;
  final String phone;

  LoginResponseUserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.countryCode,
    required this.phone,
  });

  factory LoginResponseUserData.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseUserDataToJson(this);
}
