import 'package:flutter/material.dart';
import 'package:flutter_app/route/app_route.dart';
import 'package:get/get.dart';

import 'controller/home.controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  final TextStyle errorStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 255, 0, 0));

  final TextStyle nameStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 0, 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Package App'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.profile);
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Obx(
        () => Stack(
          children: [
            RefreshIndicator(
              onRefresh: controller.refreshList,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: controller.trackList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                        key: Key("${controller.trackList[index].id}"),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          controller.removeItem(controller.trackList[index]);
                        },
                        background: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20.0),
                            child: const Icon(Icons.delete),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            controller
                                .goToDetails(controller.trackList[index].id);
                          },
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          "${controller.trackList[index].name}",
                                          style: nameStyle,
                                        ),
                                      ),
                                      Text(
                                          "${controller.trackList[index].track}")
                                    ],
                                  ),
                                  controller.trackList[index].delivered == true
                                      ? const SizedBox(
                                          height: 40,
                                          width: 70,
                                          child: Card(
                                            color: Colors.green,
                                            child: Center(
                                              child: Text('livré'),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(
                                          height: 40,
                                          width: 70,
                                          child: Card(
                                            color: Colors.orange,
                                            child: Center(
                                              child: Text('en cours'),
                                            ),
                                          ),
                                        )
                                ],
                              ),
                            ),
                          ),
                        ));
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 20.0, // position du bouton en bas de l'écran
              right: 20.0, // position du bouton à droite de l'écran
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Ajouter un suivi de colis'),
                        content: SizedBox(
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 30,
                                child: TextField(
                                  controller: controller.name,
                                  style: const TextStyle(fontSize: 16.0),
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Nom du suivi",
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: 30,
                                  child: TextField(
                                    controller: controller.track,
                                    style: const TextStyle(fontSize: 16.0),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "numéro de suivi",
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                                child: controller.error.value != ''
                                    ? Text(
                                        controller.error.value,
                                        style: errorStyle,
                                      )
                                    : const Text(''),
                              )
                            ],
                          ),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  onPressed: () async {
                                    if (await controller.createItem()) {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: const Text('Ajouter')),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Fermer'),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
