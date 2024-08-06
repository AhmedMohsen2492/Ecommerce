import 'package:device_preview/device_preview.dart';
import 'package:ecommerce_route/ui/screens/auth/login/login_screen.dart';
import 'package:ecommerce_route/ui/screens/auth/signup/signup_screen.dart';
import 'package:ecommerce_route/ui/screens/cart/cart_screen.dart';
import 'package:ecommerce_route/ui/screens/main/main_screen.dart';
import 'package:ecommerce_route/ui/screens/productDetails/product_detail_screen.dart';
import 'package:ecommerce_route/ui/screens/productsOfCategory/products_of_category_screen.dart';
import 'package:ecommerce_route/ui/screens/splash/splash_screen.dart';
import 'package:ecommerce_route/ui/shared%20view%20models/cart_view_model.dart';
import 'package:ecommerce_route/ui/shared%20view%20models/wish_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'domain/Di/di.dart';

void main() {
  configureDependencies();
  runApp(
      MultiBlocProvider(providers: [
          BlocProvider(create: (context) => getIt<CartViewModel>()),
          BlocProvider(create: (context) => getIt<WishListViewModel>()),
        ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        SignUpScreen.routeName: (_) => SignUpScreen(),
        MainScreen.routeName: (_) => const MainScreen(),
        ProductsOfCategoryScreen.routeName: (_) =>
            const ProductsOfCategoryScreen(),
        ProductDetails.routeName: (_) => const ProductDetails(),
        CartScreen.routeName: (_) => const CartScreen(),
      },
    );
  }
}
