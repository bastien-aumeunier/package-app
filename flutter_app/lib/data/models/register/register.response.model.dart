import 'package:json_annotation/json_annotation.dart';

part 'register.response.model.g.dart';

@JsonSerializable()
class RegisterResponseModel {
  RegisterResponseModel({
    this.id,
    this.email,
    this.firstname,
    this.name,
    this.jwt,
  });

  String? id;
  String? email;
  String? firstname;
  String? name;
  String? jwt;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
}
