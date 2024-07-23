import 'package:dartz/dartz.dart';
import '../../../data/model/failures.dart';
import '../../../data/model/response/product_dm.dart';

abstract class ProductsOfCategoryRepo {
  Future<Either<Failure,List<ProductDM>>>  getProductsOfCategory(String id);
}