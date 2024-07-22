import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';
import 'package:ecommerce_route/ui/utils/app_assets.dart';
import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  ProductDM product;

  ProductItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
