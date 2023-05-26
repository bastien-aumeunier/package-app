import 'package:get/get.dart';

import '../../data/api_client/api_client.dart';
import '../authentification/auth.manager.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiClient());
    Get.put(AuthentificationManager());
  }
}
