import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_web_navigation/home_controller.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          width: 400,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('CRIAR PESSOA'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 150,
                      child: Text('Entre com o nome: '),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextFormField(
                        controller: controller.nameController,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 150,
                      child: Text('O número de telefone: '),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextFormField(
                        controller: controller.numberController,
                      ),
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
                      child: TextFormField(
                        controller: controller.cityController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: () => controller.savePerson(context), child: Text('Salvar')),
                const SizedBox(height: 10),
                TextButton(onPressed: () => controller.seePersons(), child: Text('Ver Pessoas'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
