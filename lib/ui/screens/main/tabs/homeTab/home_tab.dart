import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_route/data/model/response/category_dm.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/domain/Di/di.dart';
import 'package:ecommerce_route/ui/screens/main/main_screen_view_model.dart';
import 'package:ecommerce_route/ui/screens/productsOfCategory/products_of_category_screen.dart';
import 'package:ecommerce_route/ui/screens/productsOfCategory/products_of_category_view_model.dart';
import 'package:ecommerce_route/ui/utils/app_assets.dart';
import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:ecommerce_route/ui/widgets/category_item.dart';
import 'package:ecommerce_route/ui/widgets/error_view.dart';
import 'package:ecommerce_route/ui/widgets/loading_view.dart';
import 'package:ecommerce_route/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  MainScreenViewModel viewModel = getIt();
  ProductsOfCategoryViewModel productsOfCategoryViewModel = getIt();

  @override
  void initState() {
    super.initState();
    viewModel.loadCategories();
    viewModel.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CarouselSlider(
              items: [
                Image.asset(
                  AppAssets.image1,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  AppAssets.image2,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  AppAssets.image3,
                  fit: BoxFit.fill,
                ),
              ],
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                animateToClosest: true,
                viewportFraction: 1,
                height: MediaQuery.sizeOf(context).height * 0.25,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text("Categories",
                style: GoogleFonts.poppins(
                    color: AppColors.darkBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: BlocBuilder(
                bloc: viewModel.getAllCategoriesUseCase,
                builder: (context, state) {
                  if (state is BaseSuccessState<List<CategoryDM>>) {
                    return buildCategoriesGridView(state.data!);
                  } else if (state is BaseErrorState) {
                    return ErrorView(state.errorMessage);
                  } else {
                    return LoadingView();
                  }
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text("Fashion",
                style: GoogleFonts.poppins(
                    color: AppColors.darkBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: BlocBuilder(
                bloc: viewModel.getAllProductsUseCase,
                builder: (context, state) {
                  if (state is BaseSuccessState<List<ProductDM>>) {
                    return buildProductsListView(state.data!);
                  } else if (state is BaseErrorState) {
                    return ErrorView(state.errorMessage);
                  } else {
                    return LoadingView();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoriesGridView(List<CategoryDM> list) {
    return GridView.builder(
      itemCount: list.length,
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.pushNamed(context,
              ProductsOfCategoryScreen.routeName,
              arguments: list[index]);
        },
          child: CategoryItem(list, index),
      ),
    );
  }

  Widget buildProductsListView(List<ProductDM> list) {
    return ListView.builder(
      itemCount: list.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return ProductItem(list[index]);
      },
    );
  }
}
