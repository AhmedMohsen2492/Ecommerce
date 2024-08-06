import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/failures.dart';
import 'package:ecommerce_route/domain/use%20cases/userUserCases/change_password_use_case.dart';
import 'package:ecommerce_route/domain/use%20cases/userUserCases/update_user_data_use_case.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:ecommerce_route/ui/utils/dialog_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../data/model/response/AuthResponse.dart';
import '../../../../../data/utils/sharedpref_utils.dart';
import '../../../auth/login/login_screen.dart';

@injectable
class UserViewModel extends Cubit {
  ChangePasswordUseCase changePasswordUseCase;
  UpdateUserDateUseCase updateUserDateUseCase;

  SharedPrefUtils sharedPrefUtils;

  User? currentUser;

  UserViewModel(this.sharedPrefUtils, this.updateUserDateUseCase,
      this.changePasswordUseCase)
      : super(UserInitialState());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  bool oldPass = true;
  bool newPass = true;

  void changeOldPassVisibility() {
    oldPass = !oldPass;
    emit(UserInitialState());
  }

  void changeNewPassVisibility() {
    newPass = !newPass;
    emit(UserInitialState());
  }

  void logout(BuildContext context) {
    sharedPrefUtils.deleteUser();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginScreen.routeName, (Route<dynamic> route) => false);
  }

  void loadUserData() async {
    currentUser = await sharedPrefUtils.getUser();
    emit(BaseSuccessState());
  }

  void updateUserData(String name, String email, BuildContext context) async {
    showLoading(context);
    Either<Failure, AuthResponse> either =
        await updateUserDateUseCase.execute(name, email);
    either.fold((error) {
      emit(UserErrorState(error.errorMessage));
    }, (user) {
      currentUser = user.user;
      sharedPrefUtils.saveUser(currentUser!);
      emit(UserSuccessState());
    });
    hideLoading(context);
  }

  void changePassword(
      String currentPassword, String newPassword, BuildContext context) async {
    showLoading(context);
    Either<Failure, AuthResponse> either =
        await changePasswordUseCase.execute(currentPassword, newPassword);
    either.fold((error) {
      emit(UserErrorState(error.errorMessage));
    }, (user) {
      currentUser = user.user;
      emit(UserSuccessState());
    });
    hideLoading(context);
  }
}

class UserInitialState {}

class UserErrorState {
  String error;

  UserErrorState(this.error);
}

class UserSuccessState {}
