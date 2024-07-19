import 'package:ecommerce_route/domain/Di/di.dart';
import 'package:ecommerce_route/ui/screens/main/tabs/homeTab/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeViewModel viewModel = getIt();

  @override
  void initState() {
    super.initState();
    viewModel.loadCategories();
    viewModel.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.red,
    );
  }
}
