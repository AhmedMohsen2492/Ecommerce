import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/ui/screens/main/tabs/favouriteTab/fav_item.dart';
import 'package:ecommerce_route/ui/shared%20view%20models/cart_view_model.dart';
import 'package:ecommerce_route/ui/shared%20view%20models/wish_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../data/model/response/cart_dm.dart';
import '../../../../../data/model/response/cart_product.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';

class FavouritesTab extends StatefulWidget {
  FavouritesTab({Key? key}) : super(key: key);

  @override
  State<FavouritesTab> createState() => _FavouritesTabState();
}

class _FavouritesTabState extends State<FavouritesTab> {
  late WishListViewModel wishListViewModel;
  late CartViewModel cartViewModel ;

  @override
  void initState() {
    super.initState();
    wishListViewModel = BlocProvider.of(context);
    cartViewModel = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<WishListViewModel, dynamic>(
      builder: (context, state) {
        if(wishListViewModel.wishListDM?.isEmpty == true)
        {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    AppAssets.empty_wish_list_image
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
                Text(
                  "Your wish list is empty",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                Text(
                  "Tab the heart button to start saving your favourite items",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary.withOpacity(0.7)
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.08,),
              ],
            ),
          );
        }else {
          return Column(
            children: [
              Expanded(
                child: BlocBuilder<CartViewModel,dynamic>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: wishListViewModel.wishListDM!.length,
                      itemBuilder: (context, index) {
                        CartDM? cartDM = cartViewModel.cartDM;
                        ProductDM favProduct = wishListViewModel.wishListDM![index] ;
                        bool isInCart = false;
                        if (cartDM != null && cartDM.products != null) {
                          var productsInCart = cartDM.products;
                          for (int i = 0; i < productsInCart!.length; i++) {
                            if (favProduct.id == productsInCart[i].product?.id) {
                              isInCart = true;
                            }
                          }
                        }
                        return FavouriteItem(favProduct,isInCart);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
