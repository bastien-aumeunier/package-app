import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/profile.controller.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Package App'),
          actions: [
            IconButton(
              onPressed: () {
                controller.logout();
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: Obx(() => Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Profile :",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        const Text("Nom : ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("${controller.user.value.lastname}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        const Text("Prenom : ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("${controller.user.value.firstname}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        const Text("Mail : ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("${controller.user.value.email}"),
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      child: const Text('Supprimer tous les suivis'),
                      onPressed: () {
                        controller.deleteAllMyTrack();
                      },
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      child: const Text('Supprimer mon compte'),
                      onPressed: () {
                        controller.deleteMyAccount();
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}
