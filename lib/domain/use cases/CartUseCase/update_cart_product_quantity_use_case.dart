import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/domain/repos/main/main_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/failures.dart';
import '../../../data/model/response/cart_dm.dart';

@injectable
class UpdateCartProductQuantityUseCase {
  MainRepo mainRepo ;
  UpdateCartProductQuantityUseCase(this.mainRepo);

  Future<Either<Failure,CartDM>> execute(String id, num quantity){
    return mainRepo.updateCartProductQuantity(id, quantity);
  }
}