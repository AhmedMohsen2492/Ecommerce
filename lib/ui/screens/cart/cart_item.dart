import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/model/response/cart_product.dart';
import '../../shared view models/cart_view_model.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class CartItem extends StatelessWidget {
  CartProduct? cartProduct;
  CartItem(this.cartProduct);

  @override
  Widget build(BuildContext context) {
    CartViewModel cartViewModel = BlocProvider.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      height: MediaQuery.sizeOf(context).height * 0.13,
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
                imageUrl: cartProduct?.product?.imageCover ?? "",
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
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.35,
                      child: Text("${cartProduct?.product?.title ?? ""}",
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
                        cartViewModel.removeProductFromCart(cartProduct?.product?.id ?? "", context);
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
                          AppAssets.delete,
                        ),
                      ),
                    ),
                  ],
                ),
                Text("${cartProduct?.product?.brand?.name ?? ""}",
                    style: GoogleFonts.poppins(
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("EGP ${cartProduct?.price ?? ""}",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: AppColors.primary,
                      ),
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      height: MediaQuery.sizeOf(context).height * 0.04,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.remove_circle_outline,
                            color: AppColors.white,
                            size: 20,
                          ),
                          Text(
                            "0",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white),
                          ),
                          Icon(
                            Icons.add_circle_outline,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
