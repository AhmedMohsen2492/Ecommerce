import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/domain/use%20cases/login_use_case.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit {
  bool isPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginUseCase loginUseCase;

  LoginViewModel(this.loginUseCase) : super(BaseInitialState());

  void login() {
    if (formKey.currentState!.validate()) {
      emit(BaseLoadingState());

      Either<Failure,bool>  response
      = loginUseCase.execute(emailController.text, passwordController.text);

      response.fold((error) {
        emit(BaseErrorState(error.errorMessage));
      }, (success) {
        emit(BaseSuccessState());
      });
    }
  }
}
