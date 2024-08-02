import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/domain/use%20cases/WishListUseCase/add_product_to_wish_list_use_case.dart';
import 'package:ecommerce_route/domain/use%20cases/WishListUseCase/get_logged_user_wish_list_use_case.dart';
import 'package:ecommerce_route/domain/use%20cases/WishListUseCase/remove_product_from_wish_list_use_case.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/model/response/product_dm.dart';
import '../utils/dialog_utils.dart';

@injectable
class WishListViewModel extends Cubit {
  GetLoggedUserWishListUseCase getLoggedUserWishListUseCase;
  AddProductToWishListUseCase addProductToWishListUseCase;
  RemoveProductFromWishListUseCase removeProductFromWishListUseCase;
  List<ProductDM>? wishListDM;

  WishListViewModel(this.getLoggedUserWishListUseCase,
      this.addProductToWishListUseCase, this.removeProductFromWishListUseCase)
      : super(BaseInitialState());

  void loadWishList() async {
    Either either = await getLoggedUserWishListUseCase.execute();
    either.fold((error) {
      emit(BaseErrorState(error));
    }, (list) {
      wishListDM = list;
      emit(BaseSuccessState());
    });
  }

  void addProductToWishList(String id, BuildContext context) async {
    showLoading(context);
    Either either = await addProductToWishListUseCase.execute(id);
    either.fold((error) {
      emit(BaseErrorState(error));
    }, (list) {
      wishListDM = list;
      emit(BaseSuccessState());
      hideLoading(context);
    });
  }

  void removeProductFromWishList(String id, BuildContext context) async {
    showLoading(context);
    Either either = await removeProductFromWishListUseCase.execute(id);
    either.fold((error) {
      emit(BaseErrorState(error));
    }, (list) {
      wishListDM = list;
      emit(BaseSuccessState());
      hideLoading(context);
    });
  }

  bool isInWishList(ProductDM product) {
    if (wishListDM != null) {
      for (int i = 0; i < wishListDM!.length; i++) {
        if (product.id == wishListDM?[i].id) {
          return true;
        }
      }
    }
    return false;
  }
}
