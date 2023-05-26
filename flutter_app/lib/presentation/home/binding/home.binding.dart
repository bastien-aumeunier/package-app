import 'package:flutter_app/core/app_export.dart';
import 'package:flutter_app/data/api_client/api_client.dart';

import '../controller/home.controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => TrackRepository());
  }
}
