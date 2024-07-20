import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ));
  }
}
