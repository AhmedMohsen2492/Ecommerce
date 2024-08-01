import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/ui/screens/productDetails/product_detail_screen.dart';
import 'package:ecommerce_route/ui/shared%20view%20models/cart_view_model.dart';
import 'package:ecommerce_route/ui/shared%20view%20models/wish_list_view_model.dart';
import 'package:ecommerce_route/ui/utils/app_assets.dart';
import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  ProductDM product;
  final bool isInCart;
  final bool isInWishList;
  ProductItem(this.product,this.isInCart,this.isInWishList, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.routeName,
        arguments: product);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.38,
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
                  CartViewModel cartViewModel = BlocProvider.of(context);
                  if(isInCart){
                    cartViewModel.removeProductFromCart(product.id!,context);
                  }else{
                    cartViewModel.addProductToCart(product.id!,context);
                  }
                },
                icon: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(6000)),
                  child: Icon(
                    isInCart ? Icons.done : Icons.add_shopping_cart_sharp,
                    color: AppColors.white,
                    size: 15.0,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                WishListViewModel wishListViewModel = BlocProvider.of(context);
                if(isInWishList){
                  wishListViewModel.removeProductFromWishList(product.id!, context);
                }else{
                  wishListViewModel.addProductToWishList(product.id!, context);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5000),
                ),
                child: Image.asset(
                  isInWishList ? AppAssets.inFavIcon : AppAssets.favIcon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
