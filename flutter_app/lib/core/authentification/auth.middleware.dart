import 'package:flutter_app/core/app_export.dart';
import 'package:flutter/material.dart';

import 'auth.manager.dart';

class AuthentificationMiddleware extends GetMiddleware {
  var authController = Get.put(AuthentificationManager());
  @override
  RouteSettings? redirect(String? route) {
    return authController.isLogged.value == true || route == '/login'
        ? null
        : const RouteSettings(name: '/login');
  }
}
