import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/response/ProductsResponse.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/data/utils/end_points.dart';
import 'package:ecommerce_route/domain/repos/productsOfCategory/data%20sources/products_of_category_ds.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsOfCategoryDS)
class ProductsOfCategoryDsImpl extends ProductsOfCategoryDS {
  @override
  Future<Either<Failure, List<ProductDM>>> getProductsOfCategory(
      String id) async {
    try {
      Uri url = Uri.https(
          EndPoints.baseUrl, EndPoints.products, {"category[in]": id});
      Response response = await get(url);
      Map json = jsonDecode(response.body);
      ProductsResponse productsResponse = ProductsResponse.fromJson(json);
      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          productsResponse.data?.isNotEmpty == true) {
        return Right(productsResponse.data!);
      } else {
        return Left(Failure("something went wrong please tru again later"));
      }
    } catch (error) {
      return Left(Failure("something went wrong"));
    }
  }
}
