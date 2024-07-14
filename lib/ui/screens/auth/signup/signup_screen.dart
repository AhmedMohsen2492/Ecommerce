import 'package:ecommerce_route/domain/Di/di.dart';
import 'package:ecommerce_route/ui/screens/auth/signup/signup_view_model.dart';
import 'package:ecommerce_route/ui/screens/main/main_screen.dart';
import 'package:ecommerce_route/ui/utils/app_assets.dart';
import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:ecommerce_route/ui/utils/dialog_utils.dart';
import 'package:ecommerce_route/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  static const String routeName = "signup";
  SignUpViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocListener(
        bloc: viewModel,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(AppAssets.routeLogo),
                const SizedBox(
                  height: 20,
                ),
                Text("Full Name",
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  controller: viewModel.nameController,
                  hintText: "enter your full name",
                  type: TextInputType.name,
                  validator: (name) {
                    if (name!.trim().isEmpty) {
                      return "please enter your name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("Mobile Number",
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  controller: viewModel.mobileController,
                  hintText: "enter your mobile number",
                  type: TextInputType.phone,
                  validator: (mobile) {
                    if (mobile!.trim().isEmpty) {
                      return "please enter your mobile number";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("E-mail address",
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  controller: viewModel.emailController,
                  hintText: "enter your email address",
                  type: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.trim().isEmpty) {
                      return "please enter email";
                    }
                    final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email);
                    if (!emailValid) {
                      return "Email format is not valid";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("Password",
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  height: 8,
                ),
                BlocBuilder(
                  bloc: viewModel,
                  builder: (context, state) {
                    return CustomTextFormField(
                      hintText: "enter your Password",
                      controller: viewModel.passwordController,
                      type: TextInputType.visiblePassword,
                      isPassword: viewModel.isPassword,
                      suffix: IconButton(
                        onPressed: () {
                          viewModel.showPassword();
                        },
                        icon: Icon(
                            viewModel.isPassword ? Icons.visibility : Icons.visibility_off),
                      ),
                      validator: (password) {
                        if (password!.isEmpty) {
                          return "please enter password";
                        }
                        if (password.trim().length < 6) {
                          return "password should be at least 6 characters";
                        }
                        return null;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.signUp();
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(14),
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text("Sign up",
                      style: GoogleFonts.poppins(
                          color: AppColors.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
        ),
        listener: (context, state) {
          if(state is BaseLoadingState){
            showLoading(context);
          }else if (state is BaseSuccessState){
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, MainScreen.routeName);
          }else if (state is BaseErrorState){
            Navigator.pop(context);
            showErrorDialog(context, state.errorMessage);
          }
        },
      )
    );
  }
}
