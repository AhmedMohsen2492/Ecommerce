import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/domain/repos/productsOfCategory/products_of_category_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../data/model/failures.dart';
import '../../../data/model/response/product_dm.dart';

@injectable
class ProductsOfCategoryUseCase {
  ProductsOfCategoryRepo productsOfCategoryRepo;

  ProductsOfCategoryUseCase(this.productsOfCategoryRepo);

  Future<Either<Failure, List<ProductDM>>> execute(String id) {
    return productsOfCategoryRepo.getProductsOfCategory(id);
  }
}
