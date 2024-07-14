// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/auth/auth_repo_impl.dart' as _i4;
import '../../ui/screens/auth/login/login_view_model.dart' as _i7;
import '../../ui/screens/auth/signup/signup_view_model.dart' as _i8;
import '../repos/auth/auth_repo.dart' as _i3;
import '../use%20cases/login_use_case.dart' as _i5;
import '../use%20cases/signup_use_case.dart' as _i6;

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
    gh.factory<_i3.AuthRepo>(() => _i4.AuthRepoImpl());
    gh.factory<_i5.LoginUseCase>(() => _i5.LoginUseCase(gh<_i3.AuthRepo>()));
    gh.factory<_i6.SignUpUseCase>(() => _i6.SignUpUseCase(gh<_i3.AuthRepo>()));
    gh.factory<_i7.LoginViewModel>(
        () => _i7.LoginViewModel(gh<_i5.LoginUseCase>()));
    gh.factory<_i8.SignUpViewModel>(
        () => _i8.SignUpViewModel(gh<_i6.SignUpUseCase>()));
    return this;
  }
}
