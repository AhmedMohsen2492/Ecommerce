import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/domain/repos/main/main_repo.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsFromSpecificBrandUseCase extends Cubit {
  MainRepo mainRepo;

  GetProductsFromSpecificBrandUseCase(this.mainRepo)
      : super(BaseInitialState());

  void execute(String id) async {
    emit(BaseLoadingState());
    Either<Failure, List<ProductDM>> either =
        await mainRepo.getProductsFromSpecificBrand(id);
    either.fold((error) {
      emit(BaseErrorState(error.errorMessage));
    }, (success) {
      emit(BaseSuccessState<List<ProductDM>>(data: success));
    });
  }
}
