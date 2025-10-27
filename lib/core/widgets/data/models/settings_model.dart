import 'package:json_annotation/json_annotation.dart';

part 'settings_model.g.dart';

@JsonSerializable()
class SettingsDataModel {
  final int id;
  final String description;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  SettingsDataModel({
    required this.id,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SettingsDataModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsDataModelToJson(this);
}

@JsonSerializable()
class SettingsResponseModel {
  final SettingsDataModel? data;
  final String message;
  final String type;
  final int status;
  final bool? showToast;

  SettingsResponseModel({
    this.data,
    required this.message,
    required this.type,
    required this.status,
    this.showToast,
  });

  factory SettingsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsResponseModelToJson(this);
}
