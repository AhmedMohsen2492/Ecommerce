import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/domain/repos/productsDetails/products_details_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../data/model/failures.dart';
import '../../../data/model/response/product_dm.dart';

@injectable
class ProductDetailsUseCase {
  ProductDetailsRepo productDetailsRepo;

  ProductDetailsUseCase(this.productDetailsRepo);

  Future<Either<Failure, ProductDM>> execute(String id) {
    return productDetailsRepo.getSpecificProduct(id);
  }
}
