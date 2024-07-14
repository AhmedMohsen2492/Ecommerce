import 'package:ecommerce_route/ui/screens/main/tabs/categoryTab/category_tab.dart';
import 'package:ecommerce_route/ui/screens/main/tabs/favouriteTab/fav_tab.dart';
import 'package:ecommerce_route/ui/screens/main/tabs/homeTab/home_tab.dart';
import 'package:ecommerce_route/ui/screens/main/tabs/userTab/user_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainScreenViewModel extends Cubit {
  MainScreenViewModel() : super(MainScreenInitialState);
  int currentIndex = 0;
  List<Widget> tabs = [HomeTab(), CategoryTab(), FavouritesTab(), UserTab()];

  changeTabs(int index) {
    currentIndex = index;
    emit(MainScreenInitialState());
  }
}

class MainScreenInitialState {}
