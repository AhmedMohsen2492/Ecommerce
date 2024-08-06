import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/domain/repos/main/main_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../data/model/failures.dart';
import '../../../data/model/response/product_dm.dart';

@injectable
class AddProductToWishListUseCase {
  MainRepo mainRepo;

  AddProductToWishListUseCase(this.mainRepo);

  Future<Either<Failure, List<ProductDM>>> execute(String id) {
    return mainRepo.addProductToWishList(id);
  }
}
