import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_web_navigation/persons_controller.dart';

class Persons extends GetView<PersonsController> {
  const Persons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 200, horizontal: 400),
          child: Obx(
            () => ListView.builder(
              itemCount: controller.persons.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('PESSOAS'),
                    SizedBox(height: 20),
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
        ),
      ),
    );
  }
}
