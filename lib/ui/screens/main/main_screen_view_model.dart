import 'package:ecommerce_route/ui/screens/main/tabs/categoryTab/category_tab.dart';
import 'package:ecommerce_route/ui/screens/main/tabs/favouriteTab/fav_tab.dart';
import 'package:ecommerce_route/ui/screens/main/tabs/homeTab/home_tab.dart';
import 'package:ecommerce_route/ui/screens/main/tabs/userTab/user_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/use cases/mainUseCases/get_all_brands_usecase.dart';
import '../../../domain/use cases/mainUseCases/get_all_categories_usecase.dart';
import '../../../domain/use cases/mainUseCases/get_all_products_usecase.dart';
import '../../../domain/use cases/mainUseCases/get_products_from_specific_brand_use_case.dart';

@injectable
class MainScreenViewModel extends Cubit {
  MainScreenViewModel(this.getAllCategoriesUseCase, this.getAllProductsUseCase,this.getProductsFromSpecificBrandUseCase
      ,this.getAllBrandsUseCase): super(MainScreenInitialState());

  int currentIndex = 0;
  List<Widget> tabs = [HomeTab(), CategoryTab(), FavouritesTab(), UserTab()];
  GetAllCategoriesUseCase getAllCategoriesUseCase ;
  GetAllProductsUseCase getAllProductsUseCase ;
  GetAllBrandsUseCase getAllBrandsUseCase;
  GetProductsFromSpecificBrandUseCase getProductsFromSpecificBrandUseCase;

  set currentTab(int newIndex){
    currentIndex = newIndex;
    emit(MainScreenInitialState());
  }

  void loadCategories(){
    getAllCategoriesUseCase.execute();
  }

  void loadProducts(){
    getAllProductsUseCase.execute();
  }

  void loadBrands() async {
    getAllBrandsUseCase.execute();
  }

  void loadProductsFromSpecificBrand(String id) async{
    getProductsFromSpecificBrandUseCase.execute(id);
  }


}

class MainScreenInitialState {}
