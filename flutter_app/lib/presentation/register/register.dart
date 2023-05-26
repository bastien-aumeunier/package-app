import 'package:flutter/material.dart';
import '../../core/app_export.dart';

import 'controller/register.controller.dart';

class RegisterScreen extends GetWidget<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  final TextStyle errorStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 255, 0, 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Register Menu",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                  ),
                ),
                TextField(
                  controller: controller.nom,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nom",
                  ),
                ),
                TextField(
                  controller: controller.prenom,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Prenom",
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
                TextField(
                  controller: controller.password2,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirm PassWord",
                  ),
                ),
                controller.error.value.isNotEmpty
                    ? Text(
                        controller.error.value,
                        style: errorStyle,
                      )
                    : const Text(''),
                SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      child: const Text("Register"),
                      onPressed: () {
                        controller.error.value = '';
                        controller.signup();
                      },
                    )),
                Row(
                  children: [
                    const Text("Deja un compte ? "),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/login");
                        },
                        child: const Text(
                          "Login",
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
