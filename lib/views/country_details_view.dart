import 'package:diario_de_viagens/controllers/country_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CountryDetailsView extends GetView<CountryDetailsController> {
  const CountryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => FutureBuilder(
        builder: (context, snapshot) {
          return Theme(
            data: ThemeData.from(colorScheme: snapshot.data!),
            child: Builder(
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: context.theme.colorScheme.inversePrimary,
                    title: Text(state.name),
                  ),
                  body: ListView(
                    padding: const EdgeInsets.all(8),
                    children: [
                      Card.filled(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Column(
                            children: [
                              Image.network(state.flag),
                              Text('Região: ${state.region}'),
                              Text('Capital: ${state.capital}'),
                            ],
                          ),
                        ),
                      ),
                      Card.filled(
                        child: ListTile(
                          title: Column(
                            children: [
                              Text('Latitude: ${state.latitude}'),
                              Text('Longitude: ${state.longitude}'),
                            ],
                          ),
                        ),
                      ),
                      FilledButton(
                        onPressed: () async {
                          final Uri url = Uri.parse(state.map);
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: const Text('Ver no Mapa'),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
        initialData: context.theme.colorScheme,
        future: ColorScheme.fromImageProvider(
          provider: NetworkImage(state!.flag),
          dynamicSchemeVariant: DynamicSchemeVariant.content,
        ),
      ),
    );
  }
}
