import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/response/category_dm.dart';
import 'package:ecommerce_route/domain/repos/main/main_repo.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUseCase extends Cubit {
  MainRepo repo;

  GetAllCategoriesUseCase(this.repo) : super(BaseInitialState());

  void execute() async {
    Either<Failure, List<CategoryDM>> either = await repo.getCategories();
    either.fold((left) {
      emit(BaseErrorState(left.errorMessage));
    }, (list) {
      emit(BaseSuccessState<List<CategoryDM>>(data: list));
    });
  }
}
