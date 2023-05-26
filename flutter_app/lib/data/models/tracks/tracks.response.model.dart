import 'package:json_annotation/json_annotation.dart';

part 'tracks.response.model.g.dart';

@JsonSerializable()
class TracksResponseModel {
  TracksResponseModel({
    this.id,
    this.name,
    this.track,
    this.delivered,
    this.userId,
  });

  String? id;
  String? name;
  String? track;
  bool? delivered;
  String? userId;

  factory TracksResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TracksResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$TracksResponseModelToJson(this);
}
