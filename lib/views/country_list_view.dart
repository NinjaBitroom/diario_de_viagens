import 'package:diario_de_viagens/controllers/country_details_controller.dart';
import 'package:diario_de_viagens/controllers/country_list_controller.dart';
import 'package:diario_de_viagens/views/country_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryListView extends GetView<CountryListController> {
  const CountryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.inversePrimary,
        title: const Text('Diario de Países'),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemBuilder: (context, index) => Card.filled(
            child: ListTile(
              onTap: () {
                Get.to(() {
                  final countryDetailController = Get.find<CountryDetailsController>();
                  countryDetailController.updateCountry(state[index]);
                  return const CountryDetailsView();
                });
              },
              leading: Image.network(state![index].flag),
              title: Text(state[index].name),
              subtitle: Text(state[index].region),
            ),
          ),
          itemCount: state?.length,
        ),
      ),
    );
  }
}
