import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/domain/use%20cases/productDetails/product_details_use_case.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsViewModel extends Cubit {
  ProductDetailsUseCase productDetailsUseCase;
  int imageIndex = 0;

  ProductDetailsViewModel(this.productDetailsUseCase)
      : super(BaseInitialState());

  void loadSpecificProduct(String id) async {
    emit(BaseLoadingState());
    Either<Failure, ProductDM> either = await productDetailsUseCase.execute(id);
    either.fold((error) {
      emit(BaseErrorState(error.errorMessage));
    }, (success) {
      emit(BaseSuccessState<ProductDM>());
    });
  }

  void setImageIndex(int index) {
    imageIndex = index;
    emit(ImageState());
  }
}

class ImageState {}
