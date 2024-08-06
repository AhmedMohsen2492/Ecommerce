import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
            content: Row(
          children: [
            Text(
              "Loading..",
              style: GoogleFonts.poppins(
                color: AppColors.primary,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            const CircularProgressIndicator(
              color: AppColors.primary,
              strokeAlign: 0.02,
            ),
          ],
        ));
      });
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

void showErrorDialog(BuildContext context, String message) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text("Error!!"),
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"))
          ],
        );
      });
}
