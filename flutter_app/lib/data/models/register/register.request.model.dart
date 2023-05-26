import 'package:json_annotation/json_annotation.dart';

part 'register.request.model.g.dart';

@JsonSerializable()
class RegisterRequestModel {
  RegisterRequestModel({
    this.lastname,
    this.firstname,
    this.email,
    this.password,
    this.confirmpassword,
  });

  String? lastname;
  String? firstname;
  String? email;
  String? password;
  String? confirmpassword;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
