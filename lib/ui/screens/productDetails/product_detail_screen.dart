import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/domain/Di/di.dart';
import 'package:ecommerce_route/ui/screens/productDetails/product_details_view_model.dart';
import 'package:ecommerce_route/ui/utils/app_assets.dart';
import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetails extends StatefulWidget {
  static const String routeName = "ProductDetails";

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductDetailsViewModel viewModel = getIt();
  ProductDM? product;
   int i = 0 ;

  @override
  void initState() {
    super.initState();
    viewModel = getIt();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.loadSpecificProduct(product?.id ?? "");
    });
  }

  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context)!.settings.arguments as ProductDM?;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Text(
              "Product Details",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Image.asset(AppAssets.shoppingIcon),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 50,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                    items: buildImages(product!.images!),
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      animateToClosest: true,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        i = index ;
                        setState(() {});
                      },
                    ),
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: i,
                    count: product!.images!.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                      dotWidth: 10,
                      dotHeight: 8,
                      dotColor: Colors.grey,
                      expansionFactor: 4,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //todo
                    },
                    child: Align(
                      alignment: Alignment.topRight,
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
                  ),
                ],
              ),
            ),
            Spacer(flex: 50,),
          ],
        ),
      ),
    );
  }

  List<Widget> buildImages(List<String> list) {
    return list.map((e) {
      return Image.network(e,fit: BoxFit.contain,);
    }).toList();
  }
}
