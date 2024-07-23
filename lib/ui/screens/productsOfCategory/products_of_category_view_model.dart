import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/use cases/productsOfCategoryUseCase/products_of_category_use_case.dart';

@injectable
class ProductsOfCategoryViewModel extends Cubit{
  ProductsOfCategoryUseCase productsOfCategoryUseCase ;

  ProductsOfCategoryViewModel(this.productsOfCategoryUseCase):super(BaseInitialState());

  void loadProductsOfCategory(String id) async{
    emit(BaseLoadingState());
    Either<Failure,List<ProductDM>> either = await productsOfCategoryUseCase.execute(id);
    either.fold((error) {
      emit(BaseErrorState(error.errorMessage));
    } , (success) {
      emit(BaseSuccessState<List<ProductDM>>(
        data: success
      ));
    });
  }
}