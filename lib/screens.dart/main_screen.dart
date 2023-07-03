import 'package:flutter/material.dart';
import 'package:online_shop/helping_widgets/bootom_nav.dart';
import 'package:online_shop/provider/mainscreen_provider.dart';
import 'package:online_shop/screens.dart/add_screen.dart';
import 'package:online_shop/screens.dart/cart_screen.dart';
import 'package:online_shop/screens.dart/home_screen.dart';
import 'package:online_shop/screens.dart/profile_screen.dart';
import 'package:online_shop/screens.dart/search_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  List<Widget> pagelist = [
    Home_Screen(),
    Search_Screen(),
    Add_Screen(),
    Cart_Screen(),
    Profile_Screen()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        builder: (context, mainScreenNotifier, child) {
      return Scaffold(
        backgroundColor: Color(0xFFE2E2E2),
        body: pagelist[mainScreenNotifier.pageindex],
        bottomNavigationBar: Bottom_Nav(),
      );
    });
  }
}
