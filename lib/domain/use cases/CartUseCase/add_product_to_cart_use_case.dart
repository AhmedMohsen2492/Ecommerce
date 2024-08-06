import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/domain/repos/main/main_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../data/model/failures.dart';
import '../../../data/model/response/cart_dm.dart';

@injectable
class AddProductToCartUseCase {
  MainRepo mainRepo;

  AddProductToCartUseCase(this.mainRepo);

  Future<Either<Failure, CartDM>> execute(String id) {
    return mainRepo.addProductToCart(id);
  }
}
