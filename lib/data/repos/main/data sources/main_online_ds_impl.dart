import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/response/CartResponse.dart';
import 'package:ecommerce_route/data/model/response/CategoriesResponse.dart';
import 'package:ecommerce_route/data/model/response/ProductsResponse.dart';
import 'package:ecommerce_route/data/model/response/cart_dm.dart';
import 'package:ecommerce_route/data/model/response/category_dm.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/data/model/response/wish_list_response.dart';
import 'package:ecommerce_route/data/utils/end_points.dart';
import 'package:ecommerce_route/domain/repos/main/data%20sources/main_online_ds.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import '../../../utils/sharedpref_utils.dart';

@Injectable(as: MainOnlineDS)
class MainOnlineDsImpl extends MainOnlineDS {
  SharedPrefUtils sharedPrefUtils;

  MainOnlineDsImpl(this.sharedPrefUtils);

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

  @override
  Future<Either<Failure, List<CategoryDM>>> getBrands() async {
    try {
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.brands);
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
  Future<Either<Failure, List<ProductDM>>> getProductsFromSpecificBrand(
      String id) async {
    try {
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.products, {
        "brand": id,
      });
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

  @override
  Future<Either<Failure, CartDM>> getLoggedUserCart() async {
    try {
      String token = (await sharedPrefUtils.getToken())!;
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.cart);
      Response response = await get(url, headers: {"token": token});
      Map json = jsonDecode(response.body);
      CartResponse cartResponse = CartResponse.fromJson(json);
      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          cartResponse.data != null) {
        return Right(cartResponse.data!);
      } else {
        return Left(Failure(cartResponse.message ??
            "something went wrong please tru again later"));
      }
    } catch (e) {
      print("Exception $e");
      return Left(Failure("something went wrong"));
    }
  }

  @override
  Future<Either<Failure, CartDM>> addProductToCart(String id) async {
    try {
      String token = (await sharedPrefUtils.getToken())!;
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.cart);
      Response response =
          await post(url, body: {"productId": id}, headers: {"token": token});
      Map json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return getLoggedUserCart();
      } else {
        return Left(Failure(
            json["message"] ?? "something went wrong please tru again later"));
      }
    } catch (e) {
      print("Exception $e");
      return Left(Failure("something went wrong"));
    }
  }

  @override
  Future<Either<Failure, CartDM>> removeProductsFromCart(String id) async {
    try {
      String token = (await sharedPrefUtils.getToken())!;
      Uri url = Uri.parse("https://ecommerce.routemisr.com/api/v1/cart/$id");
      Response response = await delete(url, headers: {"token": token});
      Map json = jsonDecode(response.body);
      CartResponse cartResponse = CartResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponse.data!);
      } else {
        return Left(Failure(
            json["message"] ?? "something went wrong please tru again later"));
      }
    } catch (e) {
      print("Exception $e");
      return Left(Failure("something went wrong"));
    }
  }

  @override
  Future<Either<Failure, CartDM>> updateCartProductQuantity(
      String id, num quantity) async {
    try {
      String token = (await sharedPrefUtils.getToken())!;
      Uri url = Uri.parse("https://ecommerce.routemisr.com/api/v1/cart/$id");
      Response response =
          await put(url, headers: {"token": token}, body: {"count": "$quantity"});

      Map json = jsonDecode(response.body);
      CartResponse cartResponse = CartResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponse.data!);
      } else {
        return Left(Failure(
            json["message"] ?? "something went wrong please tru again later"));
      }
    } catch (e) {
      print("Exception $e");
      return Left(Failure("something went wrong"));
    }
  }

  @override
  Future<Either<Failure, List<ProductDM>>> getLoggedUserWishList() async {
    try {
      String token = (await sharedPrefUtils.getToken())!;
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.wishlist);
      Response response = await get(url, headers: {"token": token});
      Map json = jsonDecode(response.body);
      WishListResponse wishListResponse = WishListResponse.fromJson(json);
      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          wishListResponse.data != null) {
        return Right(wishListResponse.data!);
      } else {
        return Left(Failure(wishListResponse.message ??
            "something went wrong please try again later"));
      }
    } catch (e) {
      print("Exception $e");
      return Left(Failure("something went wrong"));
    }
  }

  @override
  Future<Either<Failure, List<ProductDM>>> addProductToWishList(
      String id) async {
    try {
      String token = (await sharedPrefUtils.getToken())!;
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.wishlist);
      Response response =
          await post(url, body: {"productId": id}, headers: {"token": token});
      Map json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return getLoggedUserWishList();
      } else {
        return Left(Failure(
            json["message"] ?? "something went wrong please tru again later"));
      }
    } catch (e) {
      print("Exception $e");
      return Left(Failure("something went wrong"));
    }
  }

  @override
  Future<Either<Failure, List<ProductDM>>> removeProductFromWishList(
      String id) async {
    try {
      String token = (await sharedPrefUtils.getToken())!;
      Uri url =
          Uri.parse("https://${EndPoints.baseUrl}${EndPoints.wishlist}/$id");
      Response response = await delete(url, headers: {"token": token});
      Map json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return getLoggedUserWishList();
      } else {
        return Left(Failure(
            json["message"] ?? "something went wrong please try again later"));
      }
    } catch (e) {
      print("Exception $e");
      return Left(Failure("something went wrong"));
    }
  }
}
