import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_web_navigation/persons_controller.dart';

class Persons extends GetView<PersonsController> {
  const Persons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          width: 400,
          child: Card(
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('PESSOAS'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.persons.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 150,
                                  child: Text('Nome: '),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(controller.persons.elementAt(index).name),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 150,
                                  child: Text('Número: '),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(controller.persons.elementAt(index).number),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 150,
                                  child: Text('E a cidade: '),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(controller.persons.elementAt(index).city),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
