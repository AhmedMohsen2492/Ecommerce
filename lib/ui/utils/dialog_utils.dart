import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

void showLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return const AlertDialog(
            content: Row(
          children: [
            Text(
              "Loading..",
              style: TextStyle(color: AppColors.black, fontSize: 20),
            ),
            Spacer(),
            CircularProgressIndicator(
              color: AppColors.primary,
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
