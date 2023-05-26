// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventResponseModel _$EventResponseModelFromJson(Map<String, dynamic> json) =>
    EventResponseModel(
      text: json['text'] as String?,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$EventResponseModelToJson(EventResponseModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'date': instance.date.toIso8601String(),
    };
