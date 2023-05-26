import 'package:flutter_app/data/api_client/api_client.dart';
import 'package:flutter_app/data/models/user/user.response.model.dart';
import 'package:flutter_app/route/app_route.dart';

import '../../../core/app_export.dart';
import '../../../core/authentification/auth.manager.dart';
import '../../../core/utils/cache_manager.dart';

class ProfileController extends GetxController with CacheManager {
  UserRepository userRepository = Get.find();
  TrackRepository trackRepository = Get.find();
  Rx<UserResponseModel> user = UserResponseModel().obs;
  AuthentificationManager authentificationManager = Get.find();

  @override
  void onInit() {
    getInfo();
    super.onInit();
  }

  getInfo() async {
    var response = await userRepository.getUser();
    user.value = response!;
  }

  deleteMyAccount() async {
    var response = await userRepository.removeMyAccount(user.value.id);
    if (response == true) {
      authentificationManager.logOut();
    }
  }

  deleteAllMyTrack() async {
    var response = await trackRepository.removeAllTrack();
    if (response == true) {
      Get.toNamed(AppRoutes.initialRoute);
    }
  }

  logout() {
    authentificationManager.logOut();
  }
}
