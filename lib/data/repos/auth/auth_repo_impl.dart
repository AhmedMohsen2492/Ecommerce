import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/request/RegisterRequestBody.dart';
import 'package:ecommerce_route/data/model/response/AuthResponse.dart';
import 'package:ecommerce_route/domain/repos/auth/auth_repo.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  //https://ecommerce.routemisr.com/api/v1/auth/signup

  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      String baseUrl = "ecommerce.routemisr.com";
      String endPoints = "/api/v1/auth/signin";
      Uri url = Uri.https(baseUrl, endPoints);
      Response response =
          await post(url, body: {"email": email, "password": password});
      Map json = jsonDecode(response.body);
      AuthResponse authResponse = AuthResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return const Right(true);
      } else {
        return Left(Failure(authResponse.message ?? "something went wrong"));
      }
    } else {
      return Left(
          Failure("Please check your internet connection and try again later"));
    }
  }

  @override
  Future<Either<Failure, bool>> register(RegisterRequestBody body) async {

    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      String baseUrl = "ecommerce.routemisr.com";
      String endPoints = "/api/v1/auth/signup";
      Uri url = Uri.https(baseUrl, endPoints);
      Response response =
          await post(url, body: body.toJson());
      Map json = jsonDecode(response.body);
      AuthResponse authResponse = AuthResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return const Right(true);
      } else {
        return Left(Failure(authResponse.message ?? "something went wrong"));
      }
    } else {
      return Left(
          Failure("Please check your internet connection and try again later"));
    }

  }

}
