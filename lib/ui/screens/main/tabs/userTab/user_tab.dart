import 'package:ecommerce_route/domain/Di/di.dart';
import 'package:ecommerce_route/ui/screens/main/main_screen_view_model.dart';
import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class UserTab extends StatefulWidget {
  UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  MainScreenViewModel viewModel = getIt();

  @override
  void initState() {
    super.initState();
    viewModel.loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder(
            bloc: viewModel,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Welcome, ${viewModel.currentUser?.name}",
                        style: GoogleFonts.poppins(
                            color: AppColors.darkBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: 18)),
                    Text(viewModel.currentUser?.email ?? "a",
                        style: GoogleFonts.poppins(
                          color: AppColors.darkBlue.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        )),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Full name",
                        style: GoogleFonts.poppins(
                            color: AppColors.darkBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
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
                        contentPadding: EdgeInsets.all(14),
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
                    SizedBox(
                      height: 12,
                    ),
                    Text("E-mail",
                        style: GoogleFonts.poppins(
                            color: AppColors.darkBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      style: GoogleFonts.poppins(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                      decoration: InputDecoration(
                        filled: true,
                        contentPadding: EdgeInsets.all(14),
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
                    SizedBox(
                      height: 12,
                    ),
                    Text("New password",
                        style: GoogleFonts.poppins(
                            color: AppColors.darkBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      style: GoogleFonts.poppins(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(14),
                        filled: true,
                        fillColor: AppColors.white,
                        hintText: "password",
                        hintStyle: TextStyle(
                            color: AppColors.primary.withOpacity(0.4),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: AppColors.primary,
                          size: 20,
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
                    SizedBox(
                      height: 12,
                    ),
                    Text("Confirm password",
                        style: GoogleFonts.poppins(
                            color: AppColors.darkBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      style: GoogleFonts.poppins(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.white,
                        hintText: "confirm password",
                        contentPadding: EdgeInsets.all(14),
                        hintStyle: TextStyle(
                            color: AppColors.primary.withOpacity(0.4),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: AppColors.primary,
                          size: 20,
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
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.mode_edit_outline_outlined,
                            color: AppColors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Edit",
                              style: GoogleFonts.poppins(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          backgroundColor: AppColors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout,
                            color: AppColors.white,
                          ),
                          SizedBox(width: 10,),
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
        ],
      ),
    );
  }
}
