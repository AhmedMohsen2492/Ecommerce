import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/response/CategoriesResponse.dart';
import 'package:ecommerce_route/data/model/response/ProductsResponse.dart';
import 'package:ecommerce_route/data/model/response/category_dm.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/data/utils/end_points.dart';
import 'package:ecommerce_route/domain/repos/main/data%20sources/main_online_ds.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MainOnlineDS)
class MainOnlineDsImpl extends MainOnlineDS {
  @override
  Future<Either<Failure, List<CategoryDM>>> getCategories() async {
    try {
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.categories);
      Response response = await get(url);
      Map json = jsonDecode(response.body);
      CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(json);
      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          categoriesResponse.data?.isNotEmpty == true) {
        return Right(categoriesResponse.data!);
      } else {
        return Left(Failure(categoriesResponse.message ??
            "something went wrong please tru again later"));
      }
    } catch (error) {
      return Left(Failure("something went wrong"));
    }
  }

  @override
  Future<Either<Failure, List<ProductDM>>> getProducts() async {
    try {
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.products);
      Response response = await get(url);
      Map json = jsonDecode(response.body);
      ProductsResponse productsResponse = ProductsResponse.fromJson(json);
      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          productsResponse.data?.isNotEmpty == true) {
        return Right(productsResponse.data!);
      } else {
        return Left(Failure(productsResponse.message ??
            "something went wrong please tru again later"));
      }
    } catch (error) {
      return Left(Failure("something went wrong"));
    }
  }
}
