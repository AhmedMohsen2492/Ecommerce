import 'package:ecommerce_route/domain/use%20cases/get_all_categories_usecase.dart';
import 'package:ecommerce_route/domain/use%20cases/get_all_products_usecase.dart';

class HomeViewModel {
  GetAllCategoriesUseCase getAllCategoriesUseCase ;
  GetAllProductsUseCase getAllProductsUseCase ;

  HomeViewModel(this.getAllCategoriesUseCase, this.getAllProductsUseCase);

  void loadCategories(){
    getAllCategoriesUseCase.execute();
  }

  void loadProducts(){
    getAllProductsUseCase.execute();
  }
}