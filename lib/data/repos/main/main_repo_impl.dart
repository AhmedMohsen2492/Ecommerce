import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/response/cart_dm.dart';
import 'package:ecommerce_route/data/model/response/category_dm.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/domain/repos/main/data%20sources/main_online_ds.dart';
import 'package:ecommerce_route/domain/repos/main/main_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MainRepo)
class MainRepoImpl extends MainRepo {
  MainOnlineDS mainOnlineDS;

  MainRepoImpl(this.mainOnlineDS);

  @override
  Future<Either<Failure, List<CategoryDM>>> getCategories() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return mainOnlineDS.getCategories();
    } else {
      return Left(Failure("no internet connection"));
    }
  }

  @override
  Future<Either<Failure, List<ProductDM>>> getProducts() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return mainOnlineDS.getProducts();
    } else {
      return Left(Failure("no internet connection"));
    }
  }

  @override
  Future<Either<Failure, List<CategoryDM>>> getBrands() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return mainOnlineDS.getBrands();
    } else {
      return Left(Failure("no internet connection"));
    }
  }

  @override
  Future<Either<Failure, List<ProductDM>>> getProductsFromSpecificBrand(
      String id) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return mainOnlineDS.getProductsFromSpecificBrand(id);
    } else {
      return Left(Failure("no internet connection"));
    }
  }

  @override
  Future<Either<Failure, CartDM>> addProductToCart(String id) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return mainOnlineDS.addProductToCart(id);
    } else {
      return Left(Failure("no internet connection"));
    }
  }

  @override
  Future<Either<Failure, CartDM>> getLoggedUserCart() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return mainOnlineDS.getLoggedUserCart();
    } else {
      return Left(Failure("no internet connection"));
    }
  }

  @override
  Future<Either<Failure, CartDM>> removeProductsFromCart(String id) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return mainOnlineDS.removeProductsFromCart(id);
    } else {
      return Left(Failure("no internet connection"));
    }
  }
}
