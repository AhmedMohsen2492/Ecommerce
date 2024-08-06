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
import '../../data/repos/main/data%20sources/main_online_ds_impl.dart' as _i6;
import '../../data/repos/main/main_repo_impl.dart' as _i21;
import '../../data/repos/productsDetails/data%20sources/products_details_ds_impl.dart'
    as _i10;
import '../../data/repos/productsDetails/products_details_repo_impl.dart'
    as _i14;
import '../../data/repos/productsOfCategory/data%20sources/products_of_category_ds_impl.dart'
    as _i8;
import '../../data/repos/productsOfCategory/products_of_category_repo_impl.dart'
    as _i19;
import '../../data/utils/sharedpref_utils.dart' as _i3;
import '../../ui/screens/auth/login/login_view_model.dart' as _i38;
import '../../ui/screens/auth/signup/signup_view_model.dart' as _i40;
import '../../ui/screens/main/main_screen_view_model.dart' as _i42;
import '../../ui/screens/main/tabs/userTab/user_view_model.dart' as _i41;
import '../../ui/screens/productDetails/product_details_view_model.dart'
    as _i34;
import '../../ui/screens/productsOfCategory/products_of_category_view_model.dart'
    as _i23;
import '../../ui/shared%20view%20models/cart_view_model.dart' as _i43;
import '../../ui/shared%20view%20models/wish_list_view_model.dart' as _i39;
import '../repos/auth/auth_repo.dart' as _i11;
import '../repos/main/data%20sources/main_online_ds.dart' as _i5;
import '../repos/main/main_repo.dart' as _i20;
import '../repos/productsDetails/data%20sources/products_details_ds.dart'
    as _i9;
import '../repos/productsDetails/products_details_repo.dart' as _i13;
import '../repos/productsOfCategory/data%20sources/products_of_category_ds.dart'
    as _i7;
import '../repos/productsOfCategory/products_of_category_repo.dart' as _i18;
import '../use%20cases/authUseCases/login_use_case.dart' as _i15;
import '../use%20cases/authUseCases/signup_use_case.dart' as _i16;
import '../use%20cases/CartUseCase/add_product_to_cart_use_case.dart' as _i24;
import '../use%20cases/CartUseCase/get_logged_user_cart_usecase.dart' as _i25;
import '../use%20cases/CartUseCase/remove_product_from_cart_use_case.dart'
    as _i26;
import '../use%20cases/CartUseCase/update_cart_product_quantity_use_case.dart'
    as _i27;
import '../use%20cases/mainUseCases/get_all_brands_usecase.dart' as _i35;
import '../use%20cases/mainUseCases/get_all_categories_usecase.dart' as _i36;
import '../use%20cases/mainUseCases/get_all_products_usecase.dart' as _i37;
import '../use%20cases/mainUseCases/get_products_from_specific_brand_use_case.dart'
    as _i28;
import '../use%20cases/productDetails/product_details_use_case.dart' as _i17;
import '../use%20cases/productsOfCategoryUseCase/products_of_category_use_case.dart'
    as _i22;
import '../use%20cases/userUserCases/change_password_use_case.dart' as _i33;
import '../use%20cases/userUserCases/update_user_data_use_case.dart' as _i32;
import '../use%20cases/WishListUseCase/add_product_to_wish_list_use_case.dart'
    as _i29;
import '../use%20cases/WishListUseCase/get_logged_user_wish_list_use_case.dart'
    as _i30;
import '../use%20cases/WishListUseCase/remove_product_from_wish_list_use_case.dart'
    as _i31;
import 'app_module.dart' as _i44;

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
    gh.factory<_i5.MainOnlineDS>(
        () => _i6.MainOnlineDsImpl(gh<_i3.SharedPrefUtils>()));
    gh.factory<_i7.ProductsOfCategoryDS>(() => _i8.ProductsOfCategoryDsImpl());
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
        () => _i19.ProductsOfCategoryRepoImpl(gh<_i7.ProductsOfCategoryDS>()));
    gh.factory<_i20.MainRepo>(() => _i21.MainRepoImpl(gh<_i5.MainOnlineDS>()));
    gh.factory<_i22.ProductsOfCategoryUseCase>(() =>
        _i22.ProductsOfCategoryUseCase(gh<_i18.ProductsOfCategoryRepo>()));
    gh.factory<_i23.ProductsOfCategoryViewModel>(() =>
        _i23.ProductsOfCategoryViewModel(gh<_i22.ProductsOfCategoryUseCase>()));
    gh.factory<_i24.AddProductToCartUseCase>(
        () => _i24.AddProductToCartUseCase(gh<_i20.MainRepo>()));
    gh.factory<_i25.GetLoggedUserCartUseCase>(
        () => _i25.GetLoggedUserCartUseCase(gh<_i20.MainRepo>()));
    gh.factory<_i26.RemoveProductFromCartUseCase>(
        () => _i26.RemoveProductFromCartUseCase(gh<_i20.MainRepo>()));
    gh.factory<_i27.UpdateCartProductQuantityUseCase>(
        () => _i27.UpdateCartProductQuantityUseCase(gh<_i20.MainRepo>()));
    gh.factory<_i28.GetProductsFromSpecificBrandUseCase>(
        () => _i28.GetProductsFromSpecificBrandUseCase(gh<_i20.MainRepo>()));
    gh.factory<_i29.AddProductToWishListUseCase>(
        () => _i29.AddProductToWishListUseCase(gh<_i20.MainRepo>()));
    gh.factory<_i30.GetLoggedUserWishListUseCase>(
        () => _i30.GetLoggedUserWishListUseCase(gh<_i20.MainRepo>()));
    gh.factory<_i31.RemoveProductFromWishListUseCase>(
        () => _i31.RemoveProductFromWishListUseCase(gh<_i20.MainRepo>()));
    gh.factory<_i32.UpdateUserDateUseCase>(
        () => _i32.UpdateUserDateUseCase(gh<_i20.MainRepo>()));
    gh.factory<_i33.ChangePasswordUseCase>(
        () => _i33.ChangePasswordUseCase(gh<_i20.MainRepo>()));
    gh.factory<_i34.ProductDetailsViewModel>(
        () => _i34.ProductDetailsViewModel(gh<_i17.ProductDetailsUseCase>()));
    gh.factory<_i35.GetAllBrandsUseCase>(
        () => _i35.GetAllBrandsUseCase(gh<_i20.MainRepo>()));
    gh.factory<_i36.GetAllCategoriesUseCase>(
        () => _i36.GetAllCategoriesUseCase(gh<_i20.MainRepo>()));
    gh.factory<_i37.GetAllProductsUseCase>(
        () => _i37.GetAllProductsUseCase(gh<_i20.MainRepo>()));
    gh.factory<_i38.LoginViewModel>(
        () => _i38.LoginViewModel(gh<_i15.LoginUseCase>()));
    gh.factory<_i39.WishListViewModel>(() => _i39.WishListViewModel(
          gh<_i30.GetLoggedUserWishListUseCase>(),
          gh<_i29.AddProductToWishListUseCase>(),
          gh<_i31.RemoveProductFromWishListUseCase>(),
        ));
    gh.factory<_i40.SignUpViewModel>(
        () => _i40.SignUpViewModel(gh<_i16.SignUpUseCase>()));
    gh.factory<_i41.UserViewModel>(() => _i41.UserViewModel(
          gh<_i3.SharedPrefUtils>(),
          gh<_i32.UpdateUserDateUseCase>(),
          gh<_i33.ChangePasswordUseCase>(),
        ));
    gh.factory<_i42.MainScreenViewModel>(() => _i42.MainScreenViewModel(
          gh<_i36.GetAllCategoriesUseCase>(),
          gh<_i37.GetAllProductsUseCase>(),
          gh<_i28.GetProductsFromSpecificBrandUseCase>(),
          gh<_i35.GetAllBrandsUseCase>(),
          gh<_i3.SharedPrefUtils>(),
        ));
    gh.factory<_i43.CartViewModel>(() => _i43.CartViewModel(
          gh<_i25.GetLoggedUserCartUseCase>(),
          gh<_i24.AddProductToCartUseCase>(),
          gh<_i26.RemoveProductFromCartUseCase>(),
          gh<_i27.UpdateCartProductQuantityUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i44.AppModule {}
