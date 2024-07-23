import 'package:ecommerce_route/ui/screens/auth/login/login_screen.dart';
import 'package:ecommerce_route/ui/screens/auth/signup/signup_screen.dart';
import 'package:ecommerce_route/ui/screens/main/main_screen.dart';
import 'package:ecommerce_route/ui/screens/productsOfCategory/products_of_category_screen.dart';
import 'package:ecommerce_route/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'domain/Di/di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (_) => SplashScreen(),
        LoginScreen.routeName : (_) => LoginScreen(),
        SignUpScreen.routeName : (_) => SignUpScreen(),
        MainScreen.routeName: (_) => MainScreen(),
        ProductsOfCategoryScreen.routeName:(_)=>ProductsOfCategoryScreen(),
      },
    );
  }
}
