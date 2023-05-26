import 'package:json_annotation/json_annotation.dart';

part 'login.response.model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  LoginResponseModel({
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

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
