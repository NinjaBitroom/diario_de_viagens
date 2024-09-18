import 'package:diario_de_viagens/models/country_model.dart';
import 'package:get/get.dart';

class CountryDetailsController extends GetxController
    with StateMixin<CountryModel> {

  void updateCountry(CountryModel country) {
    change(country, status: RxStatus.success());
  }
}
