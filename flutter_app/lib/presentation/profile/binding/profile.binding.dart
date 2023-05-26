import 'package:flutter_app/core/app_export.dart';
import 'package:flutter_app/data/api_client/api_client.dart';

import '../controller/profile.controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => TrackRepository());
  }
}
