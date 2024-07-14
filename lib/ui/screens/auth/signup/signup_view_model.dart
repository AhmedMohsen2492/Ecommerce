import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/data/model/request/RegisterRequestBody.dart';
import 'package:ecommerce_route/domain/use%20cases/signup_use_case.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpViewModel extends Cubit{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassword = true;
  SignUpUseCase signUpUseCase ;

  SignUpViewModel(this.signUpUseCase):super(BaseInitialState());

  void showPassword() {
    isPassword = !isPassword;
    emit(ShowPass());
  }

  void signUp() async{
    if (formKey.currentState!.validate()) {
      emit(BaseLoadingState());
      RegisterRequestBody requestBody = RegisterRequestBody(
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text,
        phone: mobileController.text,
        rePassword: passwordController.text
      );

      Either<Failure,bool>  response = await signUpUseCase.execute(requestBody);

      response.fold((error) {
        emit(BaseErrorState(error.errorMessage));
      }, (success) {
        emit(BaseSuccessState());
      });
    }
  }
}