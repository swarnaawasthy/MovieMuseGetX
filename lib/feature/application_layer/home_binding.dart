import 'package:pokemon/core/network/network_layer.dart';
import 'package:pokemon/feature/application_layer/home_controller.dart';
import 'package:pokemon/feature/domain_layer/i_home_repository.dart';
import 'package:pokemon/feature/infrastructure_layer/home_repository.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiBaseHelper>(() => ApiBaseHelper());
    Get.lazyPut<IHomeRepository>(
        () => HomeRepository(apiBaseHelper: Get.find<ApiBaseHelper>()));
    Get.lazyPut<HomeController>(
        () => HomeController(Get.find<IHomeRepository>()));
  }
}
