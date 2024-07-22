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

import '../../data/repos/auth/auth_repo_impl.dart' as _i8;
import '../../data/repos/main/data%20sources/main_online_ds_impl.dart' as _i6;
import '../../data/repos/main/main_repo_impl.dart' as _i12;
import '../../data/utils/sharedpref_utils.dart' as _i3;
import '../../ui/screens/auth/login/login_view_model.dart' as _i17;
import '../../ui/screens/auth/signup/signup_view_model.dart' as _i18;
import '../../ui/screens/main/main_screen_view_model.dart' as _i19;
import '../repos/auth/auth_repo.dart' as _i7;
import '../repos/main/data%20sources/main_online_ds.dart' as _i5;
import '../repos/main/main_repo.dart' as _i11;
import '../use%20cases/authUseCases/login_use_case.dart' as _i9;
import '../use%20cases/authUseCases/signup_use_case.dart' as _i10;
import '../use%20cases/mainUseCases/get_all_brands_usecase.dart' as _i14;
import '../use%20cases/mainUseCases/get_all_categories_usecase.dart' as _i15;
import '../use%20cases/mainUseCases/get_all_products_usecase.dart' as _i16;
import '../use%20cases/mainUseCases/get_products_from_specific_brand_use_case.dart'
    as _i13;
import 'app_module.dart' as _i20;

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
    gh.factory<_i5.MainOnlineDS>(() => _i6.MainOnlineDsImpl());
    gh.factory<_i7.AuthRepo>(() => _i8.AuthRepoImpl(gh<_i3.SharedPrefUtils>()));
    gh.factory<_i9.LoginUseCase>(() => _i9.LoginUseCase(gh<_i7.AuthRepo>()));
    gh.factory<_i10.SignUpUseCase>(
        () => _i10.SignUpUseCase(gh<_i7.AuthRepo>()));
    gh.factory<_i11.MainRepo>(() => _i12.MainRepoImpl(gh<_i5.MainOnlineDS>()));
    gh.factory<_i13.GetProductsFromSpecificBrandUseCase>(
        () => _i13.GetProductsFromSpecificBrandUseCase(gh<_i11.MainRepo>()));
    gh.factory<_i14.GetAllBrandsUseCase>(
        () => _i14.GetAllBrandsUseCase(gh<_i11.MainRepo>()));
    gh.factory<_i15.GetAllCategoriesUseCase>(
        () => _i15.GetAllCategoriesUseCase(gh<_i11.MainRepo>()));
    gh.factory<_i16.GetAllProductsUseCase>(
        () => _i16.GetAllProductsUseCase(gh<_i11.MainRepo>()));
    gh.factory<_i17.LoginViewModel>(
        () => _i17.LoginViewModel(gh<_i9.LoginUseCase>()));
    gh.factory<_i18.SignUpViewModel>(
        () => _i18.SignUpViewModel(gh<_i10.SignUpUseCase>()));
    gh.factory<_i19.MainScreenViewModel>(() => _i19.MainScreenViewModel(
          gh<_i15.GetAllCategoriesUseCase>(),
          gh<_i16.GetAllProductsUseCase>(),
          gh<_i13.GetProductsFromSpecificBrandUseCase>(),
          gh<_i14.GetAllBrandsUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i20.AppModule {}
