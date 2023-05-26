import 'package:flutter_app/data/models/event/event.response.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'track.response.model.g.dart';

@JsonSerializable()
class TrackResponseModel {
  TrackResponseModel({
    this.id,
    this.name,
    this.track,
    this.delivered,
    this.userId,
    this.events,
  });

  String? id;
  String? name;
  String? track;
  bool? delivered;
  String? userId;
  List<EventResponseModel>? events;

  factory TrackResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TrackResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$TrackResponseModelToJson(this);
}
