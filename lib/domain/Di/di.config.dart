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

import '../../data/repos/auth/auth_repo_impl.dart' as _i10;
import '../../data/repos/main/data%20sources/main_online_ds_impl.dart' as _i8;
import '../../data/repos/main/main_repo_impl.dart' as _i16;
import '../../data/repos/productsOfCategory/data%20sources/products_of_category_ds_impl.dart'
    as _i6;
import '../../data/repos/productsOfCategory/products_of_category_repo_impl.dart'
    as _i14;
import '../../data/utils/sharedpref_utils.dart' as _i3;
import '../../ui/screens/auth/login/login_view_model.dart' as _i23;
import '../../ui/screens/auth/signup/signup_view_model.dart' as _i24;
import '../../ui/screens/main/main_screen_view_model.dart' as _i25;
import '../../ui/screens/productsOfCategory/products_of_category_view_model.dart'
    as _i18;
import '../repos/auth/auth_repo.dart' as _i9;
import '../repos/main/data%20sources/main_online_ds.dart' as _i7;
import '../repos/main/main_repo.dart' as _i15;
import '../repos/productsOfCategory/data%20sources/products_of_category_ds.dart'
    as _i5;
import '../repos/productsOfCategory/products_of_category_repo.dart' as _i13;
import '../use%20cases/authUseCases/login_use_case.dart' as _i11;
import '../use%20cases/authUseCases/signup_use_case.dart' as _i12;
import '../use%20cases/mainUseCases/get_all_brands_usecase.dart' as _i20;
import '../use%20cases/mainUseCases/get_all_categories_usecase.dart' as _i21;
import '../use%20cases/mainUseCases/get_all_products_usecase.dart' as _i22;
import '../use%20cases/mainUseCases/get_products_from_specific_brand_use_case.dart'
    as _i19;
import '../use%20cases/productsOfCategoryUseCase/products_of_category_use_case.dart'
    as _i17;
import 'app_module.dart' as _i26;

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
    gh.factory<_i9.AuthRepo>(
        () => _i10.AuthRepoImpl(gh<_i3.SharedPrefUtils>()));
    gh.factory<_i11.LoginUseCase>(() => _i11.LoginUseCase(gh<_i9.AuthRepo>()));
    gh.factory<_i12.SignUpUseCase>(
        () => _i12.SignUpUseCase(gh<_i9.AuthRepo>()));
    gh.factory<_i13.ProductsOfCategoryRepo>(
        () => _i14.ProductsOfCategoryRepoImpl(gh<_i5.ProductsOfCategoryDS>()));
    gh.factory<_i15.MainRepo>(() => _i16.MainRepoImpl(gh<_i7.MainOnlineDS>()));
    gh.factory<_i17.ProductsOfCategoryUseCase>(() =>
        _i17.ProductsOfCategoryUseCase(gh<_i13.ProductsOfCategoryRepo>()));
    gh.factory<_i18.ProductsOfCategoryViewModel>(() =>
        _i18.ProductsOfCategoryViewModel(gh<_i17.ProductsOfCategoryUseCase>()));
    gh.factory<_i19.GetProductsFromSpecificBrandUseCase>(
        () => _i19.GetProductsFromSpecificBrandUseCase(gh<_i15.MainRepo>()));
    gh.factory<_i20.GetAllBrandsUseCase>(
        () => _i20.GetAllBrandsUseCase(gh<_i15.MainRepo>()));
    gh.factory<_i21.GetAllCategoriesUseCase>(
        () => _i21.GetAllCategoriesUseCase(gh<_i15.MainRepo>()));
    gh.factory<_i22.GetAllProductsUseCase>(
        () => _i22.GetAllProductsUseCase(gh<_i15.MainRepo>()));
    gh.factory<_i23.LoginViewModel>(
        () => _i23.LoginViewModel(gh<_i11.LoginUseCase>()));
    gh.factory<_i24.SignUpViewModel>(
        () => _i24.SignUpViewModel(gh<_i12.SignUpUseCase>()));
    gh.factory<_i25.MainScreenViewModel>(() => _i25.MainScreenViewModel(
          gh<_i21.GetAllCategoriesUseCase>(),
          gh<_i22.GetAllProductsUseCase>(),
          gh<_i19.GetProductsFromSpecificBrandUseCase>(),
          gh<_i20.GetAllBrandsUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i26.AppModule {}
