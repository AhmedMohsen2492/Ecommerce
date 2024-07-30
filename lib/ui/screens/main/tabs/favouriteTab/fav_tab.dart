import 'package:ecommerce_route/ui/screens/main/tabs/favouriteTab/fav_view_model.dart';
import 'package:flutter/material.dart';

class FavouritesTab extends StatelessWidget {
  FavouritesTab({Key? key}) : super(key: key);
  FavouriteViewModel viewModel = FavouriteViewModel();

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.cyan,
    );
  }
}
