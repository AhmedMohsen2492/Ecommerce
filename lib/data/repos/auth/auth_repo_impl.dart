import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/domain/repos/auth/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {

  @override
  Either<Failure,bool> login(String email, String password) {
    if(false)
      return Right(true);
    else
      return Left(Failure("Errorrrrrrrr!!!!!!!!"));
  }

}