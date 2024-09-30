import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon/feature/domain_layer/home_model.dart';
import 'package:pokemon/feature/domain_layer/i_home_repository.dart';

class HomeController extends GetxController {
  HomeController(this.iHomeRepository);
  final IHomeRepository iHomeRepository;

  List<TvShows> showsList = [];
  String? selectedImage;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    fetchAPI();
  }

  fetchAPI() async {
    isLoading = true;
    update();

    Either<String, HomeModel> result = await iHomeRepository.fetchHomePage();
    result.fold((error) {}, (response) {
      showsList = response.tvShows ?? [];
      isLoading = false;
      update();
    });
  }

  void selectImage(String? imageUrl) {
    selectedImage = imageUrl;
    update();
  }
}
