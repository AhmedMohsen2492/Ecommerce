import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_route/data/model/response/category_dm.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/domain/Di/di.dart';
import 'package:ecommerce_route/ui/screens/main/main_screen_view_model.dart';
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
        if(state is BaseSuccessState<List<CategoryDM>>){
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
                    preferredSize:
                    Size.fromHeight(MediaQuery.sizeOf(context).width * 0.38),
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
                                child:  TabBar(
                                  isScrollable: true,
                                  tabAlignment: TabAlignment.start,
                                  indicatorWeight: 6,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicatorColor: AppColors.primary,
                                  tabs: tabsBuilder(state.data!),
                                  onTap: (int index) {
                                    viewModel.loadProductsFromSpecificBrand(state.data![index].id ?? "");
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
                      if(brandState is BaseSuccessState<List<ProductDM>>){
                        return  RotatedBox(
                            quarterTurns: 1,
                            child: TabBarView(
                              children: tabsViewBuilder(state.data!,brandState),
                            )
                        );
                      }else if (brandState is BaseErrorState){
                        return ErrorView(brandState.errorMessage);
                      }else{
                        return LoadingView();
                      }
                    },
                  )
                ),
              ),
            ),
          );
        }else if (state is BaseErrorState){
          return ErrorView(state.errorMessage);
        }else{
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

  List<Widget> tabsViewBuilder(List<CategoryDM> list, BaseSuccessState<List<ProductDM>> brandState) {
    return list.map((brand) {
      return ListView.builder(
        itemCount: brandState.data!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductItemWidget(brandState.data![index]),
            );
          },
      );
    }).toList();
  }

  ProductItemWidget(ProductDM product) {
     return Container(
       height: MediaQuery.of(context).size.height * 0.33 ,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.primary.withOpacity(0.3),
          ),
          color: AppColors.white),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 70,
                child: CachedNetworkImage(
                  imageUrl: product.imageCover ?? "",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${product.title}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                          color: AppColors.darkBlue,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Review (${product.ratingsAverage})",
                            style: GoogleFonts.poppins(
                                color: AppColors.darkBlue, fontSize: 12),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(AppAssets.star),
                        ],
                      ),
                      Text(
                        "EGP ${product.price}",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            color: AppColors.darkBlue, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {
                //todo
              },
              icon: Container(
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(6000)),
                child: const Icon(
                  Icons.add_rounded,
                  color: AppColors.white,
                  size: 25.0,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //todo
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5000),
              ),
              child: Image.asset(
                AppAssets.favIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }


}
