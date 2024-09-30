import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/core/config/app_routes.dart';
import 'feature/application_layer/home_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MovieMuse',
      initialRoute: AppRoute.homepage,
      getPages: AppPage.all,
      initialBinding: HomeBinding(),
    );
  }
}
