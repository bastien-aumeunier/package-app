// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      id: json['id'] as String?,
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      name: json['name'] as String?,
      jwt: json['jwt'] as String?,
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstname': instance.firstname,
      'name': instance.name,
      'jwt': instance.jwt,
    };
