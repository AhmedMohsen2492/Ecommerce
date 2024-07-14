// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/auth/auth_repo_impl.dart' as _i6;
import '../../data/utils/sharedpref_utils.dart' as _i3;
import '../../ui/screens/auth/login/login_view_model.dart' as _i9;
import '../../ui/screens/auth/signup/signup_view_model.dart' as _i10;
import '../../ui/screens/main/main_screen_view_model.dart' as _i4;
import '../repos/auth/auth_repo.dart' as _i5;
import '../use%20cases/login_use_case.dart' as _i7;
import '../use%20cases/signup_use_case.dart' as _i8;

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
    gh.factory<_i3.SharedPrefUtils>(() => _i3.SharedPrefUtils());
    gh.factory<_i4.MainScreenViewModel>(() => _i4.MainScreenViewModel());
    gh.factory<_i5.AuthRepo>(() => _i6.AuthRepoImpl(gh<_i3.SharedPrefUtils>()));
    gh.factory<_i7.LoginUseCase>(() => _i7.LoginUseCase(gh<_i5.AuthRepo>()));
    gh.factory<_i8.SignUpUseCase>(() => _i8.SignUpUseCase(gh<_i5.AuthRepo>()));
    gh.factory<_i9.LoginViewModel>(
        () => _i9.LoginViewModel(gh<_i7.LoginUseCase>()));
    gh.factory<_i10.SignUpViewModel>(
        () => _i10.SignUpViewModel(gh<_i8.SignUpUseCase>()));
    return this;
  }
}
