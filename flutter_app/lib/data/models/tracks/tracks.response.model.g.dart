// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracks.response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TracksResponseModel _$TracksResponseModelFromJson(Map<String, dynamic> json) =>
    TracksResponseModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      track: json['track'] as String?,
      delivered: json['delivered'] as bool?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$TracksResponseModelToJson(
        TracksResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'track': instance.track,
      'delivered': instance.delivered,
      'userId': instance.userId,
    };
