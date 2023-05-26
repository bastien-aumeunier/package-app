import 'package:flutter_app/data/api_client/api_client.dart';
import 'package:flutter_app/data/models/tracks/tracks.request.model.dart';
import 'package:flutter_app/data/models/tracks/tracks.response.model.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/cache_manager.dart';
import '../../../core/app_export.dart';
import '../../../route/app_route.dart';

class HomeController extends GetxController with CacheManager {
  TrackRepository trackRepository = Get.find();

  TextEditingController name = TextEditingController();
  TextEditingController track = TextEditingController();
  RxList<TracksResponseModel> trackList = <TracksResponseModel>[].obs;
  RxString error = ''.obs;

  @override
  void onInit() {
    getTrackList();
    super.onInit();
  }

  getTrackList() async {
    var response = await trackRepository.getAllTrack();
    trackList.value = response;
  }

  Future<void> refreshList() async {
    var response = await trackRepository.getAllTrack();
    trackList.value = response;
  }

  removeItem(TracksResponseModel track) async {
    var response = await trackRepository.removeTrack(track.id);
    trackList.value = response;
  }

  Future<bool> createItem() async {
    if (name.text == '' || track.text == '') {
      error.value = 'Veuillez remplir les champs ';
      return false;
    } else {
      error.value = '';
      var response = await trackRepository
          .createTrack(TracksRequestModel(name: name.text, track: track.text));
      trackList.value = response;
      name.text = '';
      track.text = '';
      return true;
    }
  }

  goToDetails(String? trackId) async {
    await Get.toNamed(AppRoutes.details,
        parameters: {'trackId': trackId ?? ""});
  }
}
