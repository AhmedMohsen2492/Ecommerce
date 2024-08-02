import 'package:ecommerce_route/data/model/response/cart_product.dart';
import 'package:ecommerce_route/ui/screens/cart/cart_item.dart';
import 'package:ecommerce_route/ui/shared%20view%20models/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  static const String routeName = "CartScreen";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartViewModel cartViewModel;

  @override
  void initState() {
    super.initState();
    cartViewModel = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cart",
            style: GoogleFonts.poppins(
              color: AppColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )),
      ),
      body: BlocBuilder<CartViewModel, dynamic>(
        builder: (context, state) {
          if(cartViewModel.cartDM?.products?.isEmpty == true)
          {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                      AppAssets.empty_cart_image
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
                  Text(
                    "Your cart is empty",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                  Text(
                    "Looks like you have not added anything to your cart.",
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
                  child: ListView.builder(
                    itemCount: cartViewModel.cartDM!.products!.length,
                    itemBuilder: (context, index) {
                      CartProduct? cartProduct = cartViewModel.cartDM!.products![index];
                      return CartItem(cartProduct);
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.12,
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width : MediaQuery.sizeOf(context).width * 0.35,
                        child: Column(
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
                              "EGP ${cartViewModel.cartDM?.totalCartPrice ?? 0}",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                color: AppColors.darkBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          //todo
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10),
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Row(
                          children: [
                            Text("Check out",
                                style: GoogleFonts.poppins(
                                    color: AppColors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(width: 20.0,),
                            const Icon(
                              Icons.arrow_forward,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
