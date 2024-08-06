import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/domain/Di/di.dart';
import 'package:ecommerce_route/ui/screens/productDetails/product_details_view_model.dart';
import 'package:ecommerce_route/ui/shared%20view%20models/cart_view_model.dart';
import 'package:ecommerce_route/ui/shared%20view%20models/wish_list_view_model.dart';
import 'package:ecommerce_route/ui/utils/app_assets.dart';
import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../cart/cart_screen.dart';

class ProductDetails extends StatefulWidget {
  static const String routeName = "ProductDetails";

  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductDetailsViewModel viewModel = getIt();
  ProductDM? product;
  late CartViewModel cartViewModel;

  late WishListViewModel wishListViewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt();
    cartViewModel = BlocProvider.of(context);
    wishListViewModel = BlocProvider.of(context);
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
            Text("Product Details",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          //imageSlideShow
                          CarouselSlider(
                            items: buildImages(product!.images!),
                            options: CarouselOptions(
                              height: MediaQuery.of(context).size.height * 0.35,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                viewModel.setImageIndex(index);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: BlocBuilder(
                              bloc: viewModel,
                              builder: (context, state) {
                                return AnimatedSmoothIndicator(
                                  activeIndex: viewModel.imageIndex,
                                  count: product!.images!.length,
                                  effect: const ExpandingDotsEffect(
                                    activeDotColor: AppColors.primary,
                                    dotWidth: 10,
                                    dotHeight: 8,
                                    dotColor: Colors.grey,
                                    expansionFactor: 4,
                                  ),
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                if (wishListViewModel.isInWishList(product!)) {
                                  wishListViewModel.removeProductFromWishList(
                                      product!.id!, context);
                                } else {
                                  wishListViewModel.addProductToWishList(
                                      product!.id!, context);
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(5000),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  wishListViewModel.isInWishList(product!)
                                      ? AppAssets.inFavIcon
                                      : AppAssets.favIcon,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "${product?.title}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.poppins(
                        color: AppColors.darkBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: AppColors.primary.withOpacity(0.3)),
                          ),
                          child: Text(
                            "${product!.sold} Sold",
                            style: GoogleFonts.poppins(
                              color: AppColors.darkBlue,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Image.asset(AppAssets.star),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${product!.ratingsAverage} (${product!.ratingsQuantity})",
                              style: GoogleFonts.poppins(
                                  color: AppColors.darkBlue, fontSize: 14),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          "EGP ${product!.price}",
                          style: GoogleFonts.poppins(
                            color: AppColors.darkBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Description",
                      style: GoogleFonts.poppins(
                        color: AppColors.darkBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ReadMoreText(
                      product?.description?.trim() ?? "",
                      trimLines: 4,
                      trimMode: TrimMode.Line,
                      trimExpandedText: " Show Less",
                      trimCollapsedText: " Show More",
                      moreStyle: GoogleFonts.poppins(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      lessStyle: GoogleFonts.poppins(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      style: GoogleFonts.poppins(
                        color: AppColors.darkBlue.withOpacity(0.6),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder(
              bloc: viewModel,
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total price",
                              style: GoogleFonts.poppins(
                                color: AppColors.darkBlue.withOpacity(0.6),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "EGP ${(product!.price!) * (cartViewModel.isInCart(product!)?.count ?? 0)}",
                              style: GoogleFonts.poppins(
                                color: AppColors.darkBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              border: Border.all(
                                color: AppColors.white,
                              ),
                              borderRadius: BorderRadius.circular(500)),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    cartViewModel.updateCartProductQuantity(
                                        product!.id!,
                                        cartViewModel
                                                .isInCart(product)!
                                                .count! -
                                            1,
                                        context);
                                  },
                                  icon: Image.asset(
                                    AppAssets.mini,
                                  )),
                              Text(
                                  "${cartViewModel.isInCart(product!)?.count ?? 0}",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: AppColors.white)),
                              IconButton(
                                onPressed: () {
                                  cartViewModel.addProductToCart(
                                      product!.id!, context);
                                },
                                icon: Image.asset(AppAssets.add),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (cartViewModel.isInCart(product!) != null) {
                          cartViewModel.removeProductFromCart(
                              product!.id!, context);
                        } else {
                          cartViewModel.addProductToCart(product!.id!, context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            cartViewModel.isInCart(product!) != null
                                ? Icons.remove_shopping_cart_sharp
                                : Icons.add_shopping_cart_rounded,
                            color: AppColors.white,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                              cartViewModel.isInCart(product!) != null
                                  ? "Remove from cart"
                                  : "Add to Cart",
                              style: GoogleFonts.poppins(
                                  color: AppColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildImages(List<String> list) {
    return list.map((image) {
      return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.lightGrey, width: 2),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: CachedNetworkImage(
            imageUrl: image,
            imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
            progressIndicatorBuilder: (_, __, ___) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                ),
            errorWidget: (_, __, ___) => const Center(
                  child: Icon(Icons.error),
                )),
      );
    }).toList();
  }

  buildAddButton() {}

  buildCartOptions() {}
}
