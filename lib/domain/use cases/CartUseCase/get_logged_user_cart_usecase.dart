import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../data/model/failures.dart';
import '../../../data/model/response/cart_dm.dart';
import '../../repos/main/main_repo.dart';

@injectable
class GetLoggedUserCartUseCase {
  MainRepo mainRepo;

  GetLoggedUserCartUseCase(this.mainRepo);

  Future<Either<Failure, CartDM>> execute() {
    return mainRepo.getLoggedUserCart();
  }
}
