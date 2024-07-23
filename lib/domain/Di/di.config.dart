// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/auth/auth_repo_impl.dart' as _i12;
import '../../data/repos/main/data%20sources/main_online_ds_impl.dart' as _i8;
import '../../data/repos/main/main_repo_impl.dart' as _i21;
import '../../data/repos/productsDetails/data%20sources/products_details_ds_impl.dart'
    as _i10;
import '../../data/repos/productsDetails/products_details_repo_impl.dart'
    as _i14;
import '../../data/repos/productsOfCategory/data%20sources/products_of_category_ds_impl.dart'
    as _i6;
import '../../data/repos/productsOfCategory/products_of_category_repo_impl.dart'
    as _i19;
import '../../data/utils/sharedpref_utils.dart' as _i3;
import '../../ui/screens/auth/login/login_view_model.dart' as _i29;
import '../../ui/screens/auth/signup/signup_view_model.dart' as _i30;
import '../../ui/screens/main/main_screen_view_model.dart' as _i31;
import '../../ui/screens/productDetails/product_details_view_model.dart'
    as _i25;
import '../../ui/screens/productsOfCategory/products_of_category_view_model.dart'
    as _i23;
import '../repos/auth/auth_repo.dart' as _i11;
import '../repos/main/data%20sources/main_online_ds.dart' as _i7;
import '../repos/main/main_repo.dart' as _i20;
import '../repos/productsDetails/data%20sources/products_details_ds.dart'
    as _i9;
import '../repos/productsDetails/products_details_repo.dart' as _i13;
import '../repos/productsOfCategory/data%20sources/products_of_category_ds.dart'
    as _i5;
import '../repos/productsOfCategory/products_of_category_repo.dart' as _i18;
import '../use%20cases/authUseCases/login_use_case.dart' as _i15;
import '../use%20cases/authUseCases/signup_use_case.dart' as _i16;
import '../use%20cases/mainUseCases/get_all_brands_usecase.dart' as _i26;
import '../use%20cases/mainUseCases/get_all_categories_usecase.dart' as _i27;
import '../use%20cases/mainUseCases/get_all_products_usecase.dart' as _i28;
import '../use%20cases/mainUseCases/get_products_from_specific_brand_use_case.dart'
    as _i24;
import '../use%20cases/productDetails/product_details_use_case.dart' as _i17;
import '../use%20cases/productsOfCategoryUseCase/products_of_category_use_case.dart'
    as _i22;
import 'app_module.dart' as _i32;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.SharedPrefUtils>(() => _i3.SharedPrefUtils());
    gh.factory<_i4.Connectivity>(() => appModule.getConnectivity());
    gh.factory<_i5.ProductsOfCategoryDS>(() => _i6.ProductsOfCategoryDsImpl());
    gh.factory<_i7.MainOnlineDS>(() => _i8.MainOnlineDsImpl());
    gh.factory<_i9.ProductDetailsDS>(() => _i10.ProductDetailsDsImpl());
    gh.factory<_i11.AuthRepo>(
        () => _i12.AuthRepoImpl(gh<_i3.SharedPrefUtils>()));
    gh.factory<_i13.ProductDetailsRepo>(
        () => _i14.ProductDetailsRepoImpl(gh<_i9.ProductDetailsDS>()));
    gh.factory<_i15.LoginUseCase>(() => _i15.LoginUseCase(gh<_i11.AuthRepo>()));
    gh.factory<_i16.SignUpUseCase>(
        () => _i16.SignUpUseCase(gh<_i11.AuthRepo>()));
    gh.factory<_i17.ProductDetailsUseCase>(
        () => _i17.ProductDetailsUseCase(gh<_i13.ProductDetailsRepo>()));
    gh.factory<_i18.ProductsOfCategoryRepo>(
        () => _i19.ProductsOfCategoryRepoImpl(gh<_i5.ProductsOfCategoryDS>()));
    gh.factory<_i20.MainRepo>(() => _i21.MainRepoImpl(gh<_i7.MainOnlineDS>()));
    gh.factory<_i22.ProductsOfCategoryUseCase>(() =>
        _i22.ProductsOfCategoryUseCase(gh<_i18.ProductsOfCategoryRepo>()));
    gh.factory<_i23.ProductsOfCategoryViewModel>(() =>
        _i23.ProductsOfCategoryViewModel(gh<_i22.ProductsOfCategoryUseCase>()));
    gh.factory<_i24.GetProductsFromSpecificBrandUseCase>(
        () => _i24.GetProductsFromSpecificBrandUseCase(gh<_i20.MainRepo>()));
    gh.factory<_i25.ProductDetailsViewModel>(
        () => _i25.ProductDetailsViewModel(gh<_i17.ProductDetailsUseCase>()));
    gh.factory<_i26.GetAllBrandsUseCase>(
        () => _i26.GetAllBrandsUseCase(gh<_i20.MainRepo>()));
    gh.factory<_i27.GetAllCategoriesUseCase>(
        () => _i27.GetAllCategoriesUseCase(gh<_i20.MainRepo>()));
    gh.factory<_i28.GetAllProductsUseCase>(
        () => _i28.GetAllProductsUseCase(gh<_i20.MainRepo>()));
    gh.factory<_i29.LoginViewModel>(
        () => _i29.LoginViewModel(gh<_i15.LoginUseCase>()));
    gh.factory<_i30.SignUpViewModel>(
        () => _i30.SignUpViewModel(gh<_i16.SignUpUseCase>()));
    gh.factory<_i31.MainScreenViewModel>(() => _i31.MainScreenViewModel(
          gh<_i27.GetAllCategoriesUseCase>(),
          gh<_i28.GetAllProductsUseCase>(),
          gh<_i24.GetProductsFromSpecificBrandUseCase>(),
          gh<_i26.GetAllBrandsUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i32.AppModule {}
