import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';

abstract class AuthRepo {
  Either<Failure,bool> login(String email,String password);
}