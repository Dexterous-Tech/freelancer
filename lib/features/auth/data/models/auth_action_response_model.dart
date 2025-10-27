import 'package:json_annotation/json_annotation.dart';
part 'auth_action_response_model.g.dart';

@JsonSerializable()
class AuthActionResponseModel {
  final String message;
  final String type;
  final int status;
  final bool showToast;

  AuthActionResponseModel({
    required this.message,
    required this.type,
    required this.status,
    required this.showToast,
  });

  factory AuthActionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthActionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthActionResponseModelToJson(this);
}
