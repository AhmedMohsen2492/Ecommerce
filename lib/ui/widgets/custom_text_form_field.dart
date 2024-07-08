import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  bool isPassword;
  TextEditingController controller ;
  TextInputType type;
  IconButton? suffix ;
  String? Function(String?)? validator ;

  CustomTextFormField({
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    required this.type,
    this.suffix,
    this.validator,
});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      validator: validator,
      style: TextStyle(
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        hintText: hintText,
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        disabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}
