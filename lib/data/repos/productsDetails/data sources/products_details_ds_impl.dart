import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/response/SpecificProductResponse.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/data/utils/end_points.dart';
import 'package:ecommerce_route/domain/repos/productsDetails/data%20sources/products_details_ds.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDetailsDS)
class ProductDetailsDsImpl extends ProductDetailsDS {
  @override
  Future<Either<Failure, ProductDM>> getSpecificProduct(String id) async {
    try {
      Uri url = Uri.https(EndPoints.baseUrl, "${EndPoints.products}/${id}");
      Response response = await get(url);
      Map json = jsonDecode(response.body);
      SpecificProductResponse specificProductResponse =
          SpecificProductResponse.fromJson(json);
      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          specificProductResponse.data != null) {
        return Right(specificProductResponse.data!);
      } else {
        return Left(Failure("something went wrong please tru again later"));
      }
    } catch (e) {
      return Left(Failure("something went wrong"));
    }
  }
}
