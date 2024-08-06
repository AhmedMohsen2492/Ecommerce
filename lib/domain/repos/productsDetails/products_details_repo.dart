import 'package:dartz/dartz.dart';
import '../../../data/model/failures.dart';
import '../../../data/model/response/product_dm.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, ProductDM>> getSpecificProduct(String id);
}
