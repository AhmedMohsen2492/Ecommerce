import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteViewModel extends Cubit{
  FavouriteViewModel():super(InitialState());
  List<ProductDM> wishList = [];

  void addToWishList(ProductDM product){
    wishList.add(product);
    emit(SuccessState(wishList));
    print(wishList.length);
  }

  void removeFromWishList(ProductDM product){
    wishList.remove(product);
    emit(SuccessState(wishList));
  }

}

class InitialState {}

class LoadingState {}

class SuccessState {
  List<ProductDM> wishList;
  SuccessState(this.wishList);
}