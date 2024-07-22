import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/request/RegisterRequestBody.dart';
import 'package:ecommerce_route/domain/repos/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  AuthRepo repo ;
  SignUpUseCase(this.repo);

  Future<Either<Failure,bool>> execute(RegisterRequestBody body){
    return repo.register(body);
  }
}