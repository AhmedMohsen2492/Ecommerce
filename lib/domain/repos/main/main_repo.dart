import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/response/category_dm.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import '../../../data/model/response/cart_dm.dart';

abstract class MainRepo {
  Future<Either<Failure, List<CategoryDM>>> getCategories();

  Future<Either<Failure, List<ProductDM>>> getProducts();

  Future<Either<Failure, List<CategoryDM>>> getBrands();

  Future<Either<Failure, List<ProductDM>>> getProductsFromSpecificBrand(String id);

  Future<Either<Failure,CartDM>> getLoggedUserCart();

  Future<Either<Failure,CartDM>> addProductToCart(String id);

  Future<Either<Failure,CartDM>> removeProductsFromCart(String id);
}
