import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/domain/repos/main/main_repo.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase extends Cubit {
  MainRepo repo;

  GetAllProductsUseCase(this.repo) : super(BaseInitialState());

  void execute() async {
    Either<Failure, List<ProductDM>> either = await repo.getProducts();
    either.fold((left) {
      emit(BaseErrorState(left.errorMessage));
    }, (list) {
      emit(BaseSuccessState<List<ProductDM>>(data: list));
    });
  }
}
