import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

class MyErrorWidget {

  static void showError(
      {required BuildContext context,
        required String errorTitle,
        required String errorDescription,
        required List<Widget> actions
      }) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(
              Icons.error,
              color: AppColors.red,
              size: 40,
            ),
            title: Text(
             errorTitle,
              style: GoogleFonts.poppins(
                  color: AppColors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),
            ),
            content: Text(
              errorDescription,
              style: GoogleFonts.poppins(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.center,
            ),
            actions: actions,
            alignment: Alignment.center,
            actionsAlignment: MainAxisAlignment.center,
            surfaceTintColor: AppColors.red,
            scrollable: true,
          );
        }
    );
  }
}