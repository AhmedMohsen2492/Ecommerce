import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import '../../../../data/model/response/product_dm.dart';

abstract class ProductsOfCategoryDS {
  Future<Either<Failure, List<ProductDM>>> getProductsOfCategory(String id);
}
