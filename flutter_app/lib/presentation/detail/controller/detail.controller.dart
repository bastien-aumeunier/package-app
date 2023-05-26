import 'package:flutter_app/data/api_client/api_client.dart';
import 'package:flutter_app/data/models/track/track.response.model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/cache_manager.dart';
import '../../../core/app_export.dart';

class DetailController extends GetxController with CacheManager {
  TrackRepository trackRepository = Get.find();
  var trackId = Get.parameters['trackId'] ?? "";
  Rx<TrackResponseModel> trackDetail = TrackResponseModel().obs;
  RxString error = ''.obs;

  @override
  onInit() {
    getDetail();
    super.onInit();
  }

  getDetail() async {
    var response = await trackRepository.getTrackById(trackId);
    if (response != null) {
      trackDetail.value = response;
    } else {
      error.value = 'Invalide Numéro de Suivi';
    }
  }

  Future<void> openBrowser(String? track) async {
    if (track != null) {
      if (!await launchUrl(Uri.parse(
          'https://www.laposte.fr/outils/suivre-vos-envois?code=$track'))) {
        throw Exception('Could not launch the track of $track');
      }
    }
  }
}
