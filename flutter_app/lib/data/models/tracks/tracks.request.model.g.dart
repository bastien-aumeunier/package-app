// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracks.request.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TracksRequestModel _$TracksRequestModelFromJson(Map<String, dynamic> json) =>
    TracksRequestModel(
      name: json['name'] as String?,
      track: json['track'] as String?,
    );

Map<String, dynamic> _$TracksRequestModelToJson(TracksRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'track': instance.track,
    };
