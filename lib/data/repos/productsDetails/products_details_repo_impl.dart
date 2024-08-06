import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/domain/repos/productsDetails/data%20sources/products_details_ds.dart';
import 'package:ecommerce_route/domain/repos/productsDetails/products_details_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDetailsRepo)
class ProductDetailsRepoImpl extends ProductDetailsRepo {
  ProductDetailsDS productDetailsDS;

  ProductDetailsRepoImpl(this.productDetailsDS);

  @override
  Future<Either<Failure, ProductDM>> getSpecificProduct(String id) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return productDetailsDS.getSpecificProduct(id);
    } else {
      return Left(Failure("no internet connection"));
    }
  }
}
