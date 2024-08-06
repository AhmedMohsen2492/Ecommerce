import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_route/data/model/response/category_dm.dart';
import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../screens/productsOfCategory/products_of_category_screen.dart';

class CategoryItem extends StatelessWidget {
  CategoryDM category;

  CategoryItem(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductsOfCategoryScreen.routeName,
            arguments: category);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          image(category),
          Text(
            category.name!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: AppColors.darkBlue,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

image(CategoryDM category) {
  return CachedNetworkImage(
    imageUrl: category.image ?? "a",
    imageBuilder: (context, imageProvider) => Container(
      height: MediaQuery.sizeOf(context).height * 0.1,
      width: MediaQuery.sizeOf(context).width * 0.2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    ),
    placeholder: (context, url) => const CircularProgressIndicator(
      color: AppColors.primary,
    ),
    errorWidget: (context, url, error) {
      return const Icon(Icons.error_outline_outlined);
    },
    errorListener: (value) => print(value),
  );
}
