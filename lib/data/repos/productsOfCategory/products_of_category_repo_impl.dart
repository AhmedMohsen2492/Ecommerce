import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/domain/repos/productsOfCategory/data%20sources/products_of_category_ds.dart';
import 'package:ecommerce_route/domain/repos/productsOfCategory/products_of_category_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsOfCategoryRepo)
class ProductsOfCategoryRepoImpl extends ProductsOfCategoryRepo {
  ProductsOfCategoryDS productsOfCategoryDS;

  ProductsOfCategoryRepoImpl(this.productsOfCategoryDS);

  @override
  Future<Either<Failure, List<ProductDM>>> getProductsOfCategory(
      String id) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return productsOfCategoryDS.getProductsOfCategory(id);
    } else {
      return Left(Failure("no internet connection"));
    }
  }
}
