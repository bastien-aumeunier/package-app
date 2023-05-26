import 'package:flutter/material.dart';
import 'package:flutter_app/core/app_export.dart';
import 'package:intl/intl.dart';

import 'controller/detail.controller.dart';

class DetailScreen extends GetWidget<DetailController> {
  const DetailScreen({Key? key}) : super(key: key);

  final TextStyle errorStyle = const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 0, 0));

  final TextStyle nameStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 0, 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Package App'),
        actions: [
          IconButton(
            onPressed: () {
              controller.openBrowser(controller.trackDetail.value.track);
            },
            icon: const Icon(Icons.open_in_browser),
          )
        ],
      ),
      body: Obx(() => controller.trackDetail.value.id != null
          ? Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "${controller.trackDetail.value.name}",
                      style: nameStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: [
                              const Text(
                                "Numéro : ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("${controller.trackDetail.value.track}")
                            ],
                          ),
                        ),
                        controller.trackDetail.value.delivered == true
                            ? const Card(
                                color: Colors.green,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Le colis est livré",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              )
                            : const Card(
                                color: Colors.orange,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Votre colis est en cours de livraison",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 10),
                    child: Text(
                      "Avancement :",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.trackDetail.value.events?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Le ${DateFormat('dd-MM-yyyy').format(controller.trackDetail.value.events![index].date)}"),
                              Card(
                                color: const Color.fromARGB(125, 255, 255, 255),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                      "${controller.trackDetail.value.events![index].text}"),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
                //faire la page details
              ),
            )
          : Center(
              child: Text(
                "Le numéro de suivi est invalide",
                style: errorStyle,
              ),
            )),
    );
  }
}
