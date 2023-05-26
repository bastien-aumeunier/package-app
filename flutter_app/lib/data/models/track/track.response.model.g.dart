// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackResponseModel _$TrackResponseModelFromJson(Map<String, dynamic> json) =>
    TrackResponseModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      track: json['track'] as String?,
      delivered: json['delivered'] as bool?,
      userId: json['userId'] as String?,
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => EventResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrackResponseModelToJson(TrackResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'track': instance.track,
      'delivered': instance.delivered,
      'userId': instance.userId,
      'events': instance.events,
    };
