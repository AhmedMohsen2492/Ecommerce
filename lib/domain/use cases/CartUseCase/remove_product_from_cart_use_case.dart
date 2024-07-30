import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/response/cart_dm.dart';
import 'package:ecommerce_route/domain/repos/main/main_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveProductFromCartUseCase {
  MainRepo mainRepo;
  RemoveProductFromCartUseCase(this.mainRepo);

  Future<Either<Failure, CartDM>> execute(String id ){
    return mainRepo.removeProductsFromCart(id);
  }
}