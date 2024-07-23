import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';

abstract class ProductDetailsDS {
  Future<Either<Failure,ProductDM>> getSpecificProduct(String id);
}