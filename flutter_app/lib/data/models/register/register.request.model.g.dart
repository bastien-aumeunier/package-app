// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.request.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestModel _$RegisterRequestModelFromJson(
        Map<String, dynamic> json) =>
    RegisterRequestModel(
      lastname: json['lastname'] as String?,
      firstname: json['firstname'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      confirmpassword: json['confirmpassword'] as String?,
    );

Map<String, dynamic> _$RegisterRequestModelToJson(
        RegisterRequestModel instance) =>
    <String, dynamic>{
      'lastname': instance.lastname,
      'firstname': instance.firstname,
      'email': instance.email,
      'password': instance.password,
      'confirmpassword': instance.confirmpassword,
    };
