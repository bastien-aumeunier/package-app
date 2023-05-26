import '../../route/app_route.dart';
import '../utils/cache_manager.dart';
import '../app_export.dart';

class AuthentificationManager extends GetxController with CacheManager {
  final isLogged = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  void logOut() async {
    isLogged.value = false;
    await removeJwt();
    await Get.toNamed(AppRoutes.initialRoute);
  }

  void login(String? jwt) async {
    isLogged.value = true;
    await saveJwt(jwt);
    await Get.toNamed(AppRoutes.initialRoute);
  }

  void register(String? jwt) async {
    isLogged.value = true;
    await saveJwt(jwt);
    await Get.toNamed(AppRoutes.initialRoute);
  }

  void checkLoginStatus() async {
    var token = getJwt();
    if (token == null) {
      Get.toNamed(AppRoutes.profile);
    } else {
      Get.toNamed(AppRoutes.initialRoute);
    }
  }
}
