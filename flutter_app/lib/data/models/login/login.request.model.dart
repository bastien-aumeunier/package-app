import 'package:json_annotation/json_annotation.dart';

part 'login.request.model.g.dart';

@JsonSerializable()
class LoginRequestModel {
  LoginRequestModel({
    this.email,
    this.password,
  });

  String? email;
  String? password;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
