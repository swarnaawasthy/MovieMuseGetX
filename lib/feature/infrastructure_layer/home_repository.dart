import 'package:dartz/dartz.dart';
import 'package:pokemon/core/network/network_layer.dart';
import 'package:pokemon/feature/domain_layer/home_model.dart';
import 'package:pokemon/feature/domain_layer/i_home_repository.dart';

class HomeRepository implements IHomeRepository {
  final ApiBaseHelper apiBaseHelper;
  HomeRepository({
    required this.apiBaseHelper,
  });

  @override
  Future<Either<String, HomeModel>> fetchHomePage() async {
    try {
      CustomResponse response = await apiBaseHelper.request(
        url: "https://www.episodate.com/api/most-popular?page=1",
        method: HTTPMETHOD.GET,
      );
      if (response.fullResponse.data["tv_shows"] != null) {
        return right(HomeModel.fromJson(response.fullResponse.data));
      }
      return left(response.message);
    } catch (e) {
      return left(e.toString());
    }
  }
}
