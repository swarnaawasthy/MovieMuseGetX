import 'package:get/get.dart';
import 'package:pokemon/feature/presentation_layer/home_screen.dart';

class AppPage {
  static final all = [
    GetPage(
      name: AppRoute.homepage,
      page: () => const HomeScreen(),
    ),
  ];
}

abstract class AppRoute {
  static const homepage = '/homepage';
}
