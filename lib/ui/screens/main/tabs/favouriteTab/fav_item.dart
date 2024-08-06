import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/ui/shared%20view%20models/wish_list_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../shared view models/cart_view_model.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';

class FavouriteItem extends StatelessWidget {
  ProductDM? favProduct;
  final isInCart;
  FavouriteItem(this.favProduct, this.isInCart);

  @override
  Widget build(BuildContext context) {
    CartViewModel cartViewModel = BlocProvider.of(context);
    WishListViewModel wishListViewModel = BlocProvider.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      height: MediaQuery.sizeOf(context).height * 0.14,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.primary.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 30,
            child: CachedNetworkImage(
                imageUrl: favProduct?.imageCover ?? "",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.3),
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
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
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.35,
                        child: Text("${favProduct?.title ?? ""}",
                            maxLines: 1,
                            style: GoogleFonts.poppins(
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            )),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          wishListViewModel.removeProductFromWishList(favProduct!.id!, context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(5000),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset:
                                Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Image.asset(
                            AppAssets.inFavIcon,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text("${favProduct?.brand?.name ?? ""}",
                    style: GoogleFonts.poppins(
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    )),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.25,
                        child: Text("EGP ${favProduct?.price ?? ""}",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            )),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if(isInCart){
                            cartViewModel.removeProductFromCart(favProduct!.id!,context);
                          }else{
                            cartViewModel.addProductToCart(favProduct!.id!,context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 10,),
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Text(
                            isInCart ? "remove from cart" : "add to cart",
                            style: GoogleFonts.poppins(
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
