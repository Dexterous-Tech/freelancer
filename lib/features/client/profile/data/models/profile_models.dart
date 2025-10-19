import 'package:json_annotation/json_annotation.dart';
part 'profile_models.g.dart';

@JsonSerializable()
class DeleteAccountBodyModel {
  final String password;

  DeleteAccountBodyModel({required this.password});

  factory DeleteAccountBodyModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountBodyModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteAccountBodyModelToJson(this);
}
