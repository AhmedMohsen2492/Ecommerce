import 'package:ecommerce_route/domain/Di/di.dart';
import 'package:ecommerce_route/ui/screens/main/tabs/userTab/user_view_model.dart';
import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/error_widget.dart';
import '../../../../widgets/success_alert.dart';

class UserTab extends StatefulWidget {
  const UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  late UserViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<UserViewModel>();
    viewModel.loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer(
        bloc: viewModel,
        listener: (context, state) {
          if (state is UserSuccessState) {
            SuccessAlert.showSuccessAlert(
                context: context,
                title: "Success",
                description: "Your info updated successfully",
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary),
                    child: Text(
                      "Ok",
                      style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ]);
          } else if (state is UserErrorState) {
            MyErrorWidget.showError(
                context: context,
                errorTitle: "Error",
                errorDescription: state.error,
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary),
                    child: Text(
                      "Ok",
                      style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ]);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome, ${viewModel.currentUser?.name ?? "name"}",
                    style: GoogleFonts.poppins(
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 18)),
                Text(viewModel.currentUser?.email ?? "email",
                    style: GoogleFonts.poppins(
                      color: AppColors.darkBlue.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text("Full name",
                    style: GoogleFonts.poppins(
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller: viewModel.nameController,
                  style: GoogleFonts.poppins(
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    hintText: viewModel.currentUser?.name ?? "",
                    hintStyle: TextStyle(
                        color: AppColors.primary.withOpacity(0.4),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    contentPadding: const EdgeInsets.all(14),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("E-mail",
                    style: GoogleFonts.poppins(
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller: viewModel.emailController,
                  style: GoogleFonts.poppins(
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.all(14),
                    fillColor: AppColors.white,
                    hintText: viewModel.currentUser?.email ?? "",
                    hintStyle: TextStyle(
                        color: AppColors.primary.withOpacity(0.4),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      viewModel.updateUserData(viewModel.nameController.text,
                          viewModel.emailController.text, context);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text("Save",
                        style: GoogleFonts.poppins(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text("Current password",
                    style: GoogleFonts.poppins(
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller: viewModel.currentPasswordController,
                  obscureText: viewModel.oldPass,
                  style: GoogleFonts.poppins(
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(14),
                    filled: true,
                    fillColor: AppColors.white,
                    hintText: "current password",
                    hintStyle: TextStyle(
                        color: AppColors.primary.withOpacity(0.4),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    suffixIcon: InkWell(
                      onTap: () {
                        viewModel.changeOldPassVisibility();
                      },
                      child: const Icon(
                        Icons.visibility,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("New password",
                    style: GoogleFonts.poppins(
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller: viewModel.newPasswordController,
                  obscureText: viewModel.newPass,
                  style: GoogleFonts.poppins(
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(14),
                    filled: true,
                    fillColor: AppColors.white,
                    hintText: "new password",
                    hintStyle: TextStyle(
                        color: AppColors.primary.withOpacity(0.4),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    suffixIcon: InkWell(
                      onTap: () {
                        viewModel.changeNewPassVisibility();
                      },
                      child: const Icon(
                        Icons.visibility,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      viewModel.changePassword(
                          viewModel.currentPasswordController.text,
                          viewModel.newPasswordController.text,
                          context);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text("change password",
                        style: GoogleFonts.poppins(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.logout(context);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      backgroundColor: AppColors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.logout,
                        color: AppColors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("Log out",
                          style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
