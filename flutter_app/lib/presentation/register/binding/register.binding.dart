import 'package:flutter_app/core/app_export.dart';

import '../../../data/api_client/api_client.dart';
import '../controller/register.controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => UserRepository());
  }
}
