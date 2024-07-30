import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const String routeName = "CartScreen";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Text("Cart",
                style: GoogleFonts.poppins(
                  color: AppColors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
            const Spacer(),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
                child: Image.asset(AppAssets.shoppingIcon)),
          ],
        ),
      ),
    );
  }
}
