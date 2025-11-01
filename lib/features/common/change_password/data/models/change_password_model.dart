import 'package:json_annotation/json_annotation.dart';
part 'change_password_model.g.dart';

@JsonSerializable()
class ChangePasswordRequestBodyModel {
  @JsonKey(name: 'old_password')
  final String oldPassword;

  @JsonKey(name: 'new_password')
  final String newPassword;

  @JsonKey(name: 'new_password_confirmation')
  final String newConfirmationPassword;

  ChangePasswordRequestBodyModel({
    required this.oldPassword,
    required this.newPassword,
    required this.newConfirmationPassword,
  });

  factory ChangePasswordRequestBodyModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestBodyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestBodyModelToJson(this);
}
