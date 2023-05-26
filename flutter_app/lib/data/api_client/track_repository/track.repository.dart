part of '../api_client.dart';

class TrackRepository with CacheManager {
  Future<List<TracksResponseModel>> getAllTrack() async {
    var response = await dio.get('${ApiClient.trackUrl}/my-colis');
    if (response.statusCode == 200) {
      List<TracksResponseModel> trackList = (response.data as List)
          .map((e) => TracksResponseModel.fromJson(e))
          .toList();
      return trackList;
    } else {
      throw Exception('Error get tracks');
    }
  }

  Future<TrackResponseModel?> getTrackById(String? id) async {
    var response = await dio.get('${ApiClient.trackUrl}/$id');
    if (response.statusCode == 200) {
      return TrackResponseModel.fromJson(response.data);
    } else if (response.statusCode == 403) {
      throw Exception('Invalid Track');
    } else {
      throw Exception('Error get track : $id');
    }
  }

  Future<List<TracksResponseModel>> removeTrack(String? id) async {
    var response = await dio.delete('${ApiClient.trackUrl}/$id');
    if (response.statusCode == 200) {
      List<TracksResponseModel> trackList = (response.data as List)
          .map((e) => TracksResponseModel.fromJson(e))
          .toList();
      return trackList;
    } else {
      throw Exception('Error remove track : $id');
    }
  }

  Future<List<TracksResponseModel>> createTrack(
      TracksRequestModel model) async {
    var response =
        await dio.post('${ApiClient.trackUrl}/new-colis', data: model);
    if (response.statusCode == 201) {
      List<TracksResponseModel> trackList = (response.data as List)
          .map((e) => TracksResponseModel.fromJson(e))
          .toList();
      return trackList;
    } else {
      throw Exception('Error create track');
    }
  }

  Future<bool> removeAllTrack() async {
    var response = await dio.delete('${ApiClient.trackUrl}/my-colis');
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Error remove track');
    }
  }
}
