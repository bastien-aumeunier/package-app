import 'package:json_annotation/json_annotation.dart';

part 'tracks.request.model.g.dart';

@JsonSerializable()
class TracksRequestModel {
  TracksRequestModel({
    this.name,
    this.track,
  });

  String? name;
  String? track;

  factory TracksRequestModel.fromJson(Map<String, dynamic> json) =>
      _$TracksRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$TracksRequestModelToJson(this);
}
