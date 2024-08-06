import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/domain/use%20cases/authUseCases/login_use_case.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassword = true;
  LoginUseCase loginUseCase;

  LoginViewModel(this.loginUseCase) : super(BaseInitialState());

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(BaseLoadingState());

      Either<Failure, bool> response = await loginUseCase.execute(
          emailController.text, passwordController.text);

      response.fold((error) {
        emit(BaseErrorState(error.errorMessage));
      }, (success) {
        emit(BaseSuccessState());
      });
    }
  }

  void showPassword() {
    isPassword = !isPassword;
    emit(ShowPass());
  }
}
