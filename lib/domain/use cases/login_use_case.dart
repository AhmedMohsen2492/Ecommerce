import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/domain/repos/auth/auth_repo.dart';

class LoginUseCase {
  AuthRepo repo ;
  LoginUseCase(this.repo);

  Either<Failure,bool> execute(String email, String password){
     return repo.login(email, password);
  }
}