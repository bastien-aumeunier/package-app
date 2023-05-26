import 'package:flutter_app/data/models/login/login.request.model.dart';

import '../../../core/app_export.dart';
import '../../../core/authentification/auth.manager.dart';
import '../../../core/utils/cache_manager.dart';
import 'package:flutter/material.dart';

import '../../../data/api_client/api_client.dart';

class LoginController extends GetxController with CacheManager {
  UserRepository userRepository = UserRepository();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxString error = ''.obs;

  final AuthentificationManager authentificationManager = Get.find();

  login() async {
    if (email.text == '' || password == '') {
      error.value = 'Veuillez remplir les champs ';
    } else {
      var response = await userRepository
          .login(LoginRequestModel(email: email.text, password: password.text));
      if (response != null) {
        email.text = '';
        password.text = '';
        error.value = '';
        authentificationManager.login(response.jwt);
      } else {
        error.value = 'Identifiants Incorrect';
      }
    }
  }
}
