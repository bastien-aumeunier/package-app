import 'package:flutter/material.dart';
import '../../core/app_export.dart';

import '../../route/app_route.dart';
import 'controller/login.controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  final TextStyle errorStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 255, 0, 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Login Menu",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                  ),
                ),
                TextField(
                  controller: controller.email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Mail",
                  ),
                ),
                TextField(
                  controller: controller.password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "PassWord",
                  ),
                ),
                controller.error.value != ''
                    ? Text(
                        controller.error.value,
                        style: errorStyle,
                      )
                    : const Text(''),
                SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      child: const Text("Login"),
                      onPressed: () {
                        controller.login();
                      },
                    )),
                Row(
                  children: [
                    const Text("Pas de compte ? "),
                    TextButton(
                        onPressed: () {
                          controller.error.value = '';
                          Get.toNamed(AppRoutes.register);
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
