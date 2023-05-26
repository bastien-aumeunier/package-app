import 'package:json_annotation/json_annotation.dart';

part 'user.response.model.g.dart';

@JsonSerializable()
class UserResponseModel {
  UserResponseModel({
    this.id,
    this.email,
    this.firstname,
    this.lastname,
  });

  String? id;
  String? email;
  String? firstname;
  String? lastname;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}
