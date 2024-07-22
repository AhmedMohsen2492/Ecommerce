import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/response/category_dm.dart';
import 'package:ecommerce_route/domain/repos/main/main_repo.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllBrandsUseCase extends Cubit {
  MainRepo repo;

  GetAllBrandsUseCase(this.repo):super(BaseInitialState());

  void execute() async{
    emit(BaseLoadingState());
    Either<Failure, List<CategoryDM>> either = await repo.getBrands();
    either.fold((error) {
      emit(BaseErrorState(error.errorMessage));
    }, (success) {
      emit(BaseSuccessState<List<CategoryDM>>(data: success));
    });

  }
}
