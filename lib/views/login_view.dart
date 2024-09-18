import 'package:diario_de_viagens/views/country_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diario de Viagens'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Senha',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            FilledButton(
                onPressed: () {
                  Get.offAll(const CountryListView());
                },
                child: const Text('Fazer login'))
          ],
        ),
      ),
    );
  }
}
