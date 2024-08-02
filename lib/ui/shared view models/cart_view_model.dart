import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/response/cart_dm.dart';
import 'package:ecommerce_route/data/model/response/cart_product.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/domain/use%20cases/CartUseCase/add_product_to_cart_use_case.dart';
import 'package:ecommerce_route/domain/use%20cases/CartUseCase/get_logged_user_cart_usecase.dart';
import 'package:ecommerce_route/domain/use%20cases/CartUseCase/remove_product_from_cart_use_case.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:ecommerce_route/ui/utils/dialog_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit {
  GetLoggedUserCartUseCase getLoggedUserCartUseCase;
  AddProductToCartUseCase addProductToCartUseCase;
  RemoveProductFromCartUseCase removeProductFromCartUseCase;
  CartDM? cartDM ;

  CartViewModel(this.getLoggedUserCartUseCase, this.addProductToCartUseCase,
      this.removeProductFromCartUseCase)
      : super(BaseInitialState());

  void addProductToCart(String id,BuildContext context) async{
    showLoading(context);
    Either either  = await addProductToCartUseCase.execute(id);
    either.fold((error){
      emit(BaseErrorState(error));
    }, (cart){
      cartDM = cart;
      emit(BaseSuccessState());
      hideLoading(context);
    });
  }

  void removeProductFromCart(String id,BuildContext context) async{
    showLoading(context);
    Either either  = await removeProductFromCartUseCase.execute(id);
    either.fold((error){
      emit(BaseErrorState(error));
    }, (cart){
      cartDM = cart;
      emit(BaseSuccessState());
      hideLoading(context);
    });
  }

  void loadCart() async{
    Either either  = await getLoggedUserCartUseCase.execute();
    either.fold((error){
      emit(BaseErrorState(error));
    }, (cart){
      cartDM = cart;
      emit(BaseSuccessState());
    });
  }

  CartProduct? isInCart(ProductDM? product){
    var productsInCart = cartDM?.products;
    if (cartDM != null && productsInCart != null) {
      for (int i = 0; i < productsInCart!.length; i++)
      {
        if (product?.id == productsInCart[i].product?.id) {
          return productsInCart[i] ;
        }
      }
    }
    return null;
  }
}
