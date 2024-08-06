import 'package:ecommerce_route/data/model/response/AuthResponse.dart';
import 'package:ecommerce_route/data/utils/sharedpref_utils.dart';
import 'package:ecommerce_route/domain/Di/di.dart';
import 'package:ecommerce_route/ui/screens/auth/login/login_screen.dart';
import 'package:ecommerce_route/ui/screens/main/main_screen.dart';
import 'package:ecommerce_route/ui/shared%20view%20models/wish_list_view_model.dart';
import 'package:ecommerce_route/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared view models/cart_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    CartViewModel cartViewModel = BlocProvider.of(context);
    WishListViewModel wishListViewModel = BlocProvider.of(context);
    wishListViewModel.loadWishList();
    cartViewModel.loadCart();
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        var pref = getIt<SharedPrefUtils>();
        User? user = await pref.getUser();
        if (user == null) {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(context, MainScreen.routeName);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        AppAssets.splashScreen,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
