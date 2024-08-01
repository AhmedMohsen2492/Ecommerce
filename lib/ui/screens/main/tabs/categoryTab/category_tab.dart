import 'dart:ui';
import 'package:ecommerce_route/data/model/response/category_dm.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/domain/Di/di.dart';
import 'package:ecommerce_route/ui/screens/main/main_screen_view_model.dart';
import 'package:ecommerce_route/ui/shared%20view%20models/cart_view_model.dart';
import 'package:ecommerce_route/ui/shared%20view%20models/wish_list_view_model.dart';
import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:ecommerce_route/ui/widgets/error_view.dart';
import 'package:ecommerce_route/ui/widgets/loading_view.dart';
import 'package:ecommerce_route/ui/widgets/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../data/model/response/cart_dm.dart';
import '../../../../utils/app_assets.dart';

class CategoryTab extends StatefulWidget {
  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  MainScreenViewModel viewModel = getIt();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    viewModel.loadBrands();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel.getAllBrandsUseCase,
      builder: (context, state) {
        if (state is BaseSuccessState<List<CategoryDM>>) {
          viewModel.loadProductsFromSpecificBrand(state.data![0].id ?? "");
          return DefaultTabController(
            initialIndex: 0,
            length: state.data!.length,
            child: RotatedBox(
              quarterTurns: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Scaffold(
                    appBar: PreferredSize(
                      preferredSize: Size.fromHeight(
                          MediaQuery.sizeOf(context).width * 0.38),
                      child: AppBar(
                        flexibleSpace: Container(
                          margin: EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                              color: AppColors.lightGrey.withOpacity(0.5),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              )),
                          child: Column(
                            children: [
                              Expanded(
                                child: RotatedBox(
                                  quarterTurns: 2,
                                  child: TabBar(
                                    isScrollable: true,
                                    tabAlignment: TabAlignment.start,
                                    indicatorWeight: 6,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    indicatorColor: AppColors.primary,
                                    tabs: tabsBuilder(state.data!),
                                    onTap: (int index) {
                                      viewModel.loadProductsFromSpecificBrand(
                                          state.data![index].id ?? "");
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    body: BlocBuilder(
                      bloc: viewModel.getProductsFromSpecificBrandUseCase,
                      builder: (context, brandState) {
                        if (brandState is BaseSuccessState<List<ProductDM>>) {
                          return RotatedBox(
                              quarterTurns: 1,
                              child: TabBarView(
                                physics: NeverScrollableScrollPhysics(),
                                children:
                                    tabsViewBuilder(state.data!, brandState),
                              ));
                        } else if (brandState is BaseErrorState) {
                          return RotatedBox(
                            quarterTurns: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppAssets.outOfStockImage,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.05,
                                ),
                                Text(
                                  "There is no available products for this brand",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        } else {
                          return LoadingView();
                        }
                      },
                    )),
              ),
            ),
          );
        } else if (state is BaseErrorState) {
          return ErrorView(state.errorMessage);
        } else {
          return LoadingView();
        }
      },
    );
  }

  List<Widget> tabsBuilder(List<CategoryDM> list) {
    return list.map((e) {
      return RotatedBox(
        quarterTurns: 3,
        child: Tab(
          child: Text(
            '${e.name}',
            style: GoogleFonts.poppins(
                color: AppColors.darkBlue,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> tabsViewBuilder(List<CategoryDM> brandsList,
      BaseSuccessState<List<ProductDM>> brandState) {
    return brandsList.map((brand) {
      return BlocBuilder<WishListViewModel,dynamic>(
        builder: (context, state) {
          return BlocBuilder<CartViewModel, dynamic>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: brandState.data!.length,
                itemBuilder: (context, index) {
                  CartViewModel cartViewModel = BlocProvider.of(context);
                  WishListViewModel wishListViewModel = BlocProvider.of(context);
                  CartDM? cartDM = cartViewModel.cartDM;
                  List<ProductDM>? wishList = wishListViewModel.wishListDM ;
                  var productsInCart = cartDM?.products;
                  var product = brandState.data?[index];
                  bool isInCart = false;
                  bool isInWishList = false;
                  for (int i = 0; i < productsInCart!.length; i++) {
                    if (productsInCart[i].product?.id == product?.id) {
                      isInCart = true;
                    }
                  }
                  for (int i = 0; i < wishList!.length; i++) {
                    if (wishList[i].id == product?.id) {
                      isInWishList = true;
                    }
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductItem(product!, isInCart,isInWishList),
                  );
                },
              );
            },
          );
        },
      );
    }).toList();
  }
}
