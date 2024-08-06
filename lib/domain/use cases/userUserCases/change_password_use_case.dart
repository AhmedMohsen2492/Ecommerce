import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/domain/repos/main/main_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/failures.dart';
import '../../../data/model/response/AuthResponse.dart';

@injectable
class ChangePasswordUseCase {
  MainRepo mainRepo;

  ChangePasswordUseCase(this.mainRepo);

  Future<Either<Failure, AuthResponse>> execute(
      String currentPassword, String newPassword) {
    return mainRepo.changePassword(currentPassword, newPassword);
  }
}
