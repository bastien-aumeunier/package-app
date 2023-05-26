import 'package:flutter_app/data/models/register/register.request.model.dart';

import '../../../core/app_export.dart';
import '../../../core/authentification/auth.manager.dart';
import '../../../core/utils/cache_manager.dart';
import 'package:flutter/material.dart';

import '../../../data/api_client/api_client.dart';

class RegisterController extends GetxController with CacheManager {
  UserRepository userRepository = Get.find();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  RxString error = ''.obs;

  final AuthentificationManager authentificationManager = Get.find();

  signup() async {
    if (email.text == "" ||
        password.text == "" ||
        password2.text == "" ||
        nom.text == "" ||
        prenom.text == "") {
      error.value = "mail or password or name or firstname is empty";
    } else if (password.text != password2.text) {
      error.value = "passwords are not the same";
    } else {
      var response = await userRepository.register(RegisterRequestModel(
          email: email.text,
          lastname: nom.text,
          firstname: prenom.text,
          confirmpassword: password2.text,
          password: password.text));
      if (response != null) {
        error.value = '';
        email.text = '';
        nom.text = '';
        prenom.text = '';
        password.text = '';
        password2.text = '';
        authentificationManager.register(response.jwt);
      } else {
        error.value = "error register";
      }
    }
  }
}
