import 'package:diario_de_viagens/app.dart';
import 'package:diario_de_viagens/controllers/country_details_controller.dart';
import 'package:diario_de_viagens/controllers/country_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  Get.put(CountryListController());
  Get.put(CountryDetailsController());
  runApp(const App());
}
