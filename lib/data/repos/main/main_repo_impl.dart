import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
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
}
