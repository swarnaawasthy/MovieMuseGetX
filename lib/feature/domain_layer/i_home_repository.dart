import 'package:dartz/dartz.dart';
import 'package:pokemon/feature/domain_layer/home_model.dart';

abstract class IHomeRepository{
  Future<Either<String, HomeModel>> fetchHomePage();
}