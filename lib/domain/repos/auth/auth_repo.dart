import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/request/RegisterRequestBody.dart';

abstract class AuthRepo {
  Future<Either<Failure,bool>> login(String email,String password);
  Future<Either<Failure,bool>> register(RegisterRequestBody body);
}