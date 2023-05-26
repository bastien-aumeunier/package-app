import 'package:flutter_app/core/app_export.dart';
import 'package:flutter_app/data/api_client/api_client.dart';

import '../controller/detail.controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
    Get.lazyPut(() => TrackRepository());
  }
}
