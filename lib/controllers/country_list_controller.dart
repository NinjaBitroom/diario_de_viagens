import 'dart:convert';

import 'package:diario_de_viagens/models/country_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CountryListController extends GetxController
    with StateMixin<List<CountryModel>> {
  @override
  Future<void> onInit() async {
    super.onInit();
    change(null, status: RxStatus.loading());
    final url = Uri.https('restcountries.com', '/v3.1/lang/por');
    final response = await http.get(url);
    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));
    final countries = <CountryModel>[];
    for (final r in responseBody) {
      countries.add(CountryModel(
        name: r['name']['common'],
        capital: r['capital']?[0] ?? '',
        flag: r['flags']['png'],
        region: r['region'],
        latitude: r['latlng'][0],
        longitude: r['latlng'][1],
        map: r['maps']['googleMaps'],
      ));
    }
    change(countries, status: RxStatus.success());
  }
}
