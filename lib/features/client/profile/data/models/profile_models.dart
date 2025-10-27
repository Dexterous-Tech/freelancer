import 'package:json_annotation/json_annotation.dart';
part 'profile_models.g.dart';

@JsonSerializable()
class ProfileDataModel {
  final int id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'country_code')
  final String countryCode;
  final String phone;
  @JsonKey(name: 'need_verify')
  final int? needVerification;

  ProfileDataModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.countryCode,
    required this.phone,
    this.needVerification,
  });

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataModelToJson(this);
}

@JsonSerializable()
class ProfileResponseModel {
  final ProfileDataModel? data;
  final String message;
  final String type;
  final int status;
  final bool? showToast;

  ProfileResponseModel({
    this.data,
    required this.message,
    required this.type,
    required this.status,
    this.showToast,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);
}
