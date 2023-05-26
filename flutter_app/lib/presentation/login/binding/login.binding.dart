import 'package:flutter_app/core/app_export.dart';

import '../../../data/api_client/api_client.dart';
import '../controller/login.controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => UserRepository());
  }
}
