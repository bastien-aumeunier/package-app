import 'package:json_annotation/json_annotation.dart';

part 'event.response.model.g.dart';

@JsonSerializable()
class EventResponseModel {
  EventResponseModel({
    this.text,
    required this.date,
  });

  String? text;
  DateTime date;

  factory EventResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EventResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$EventResponseModelToJson(this);
}
