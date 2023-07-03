import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:online_shop/helping_widgets/bottom_nav_widget.dart';
import 'package:online_shop/provider/mainscreen_provider.dart';
import 'package:provider/provider.dart';

class Bottom_Nav extends StatelessWidget {
  const Bottom_Nav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) => SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavWidget(
                icon: mainScreenNotifier.pageindex == 0
                    ? Icons.home
                    : Icons.home_outlined,
                onTap: () {
                  mainScreenNotifier.pageindex = 0;
                },
              ),
              BottomNavWidget(
                icon: mainScreenNotifier.pageindex == 1
                    ? Ionicons.search
                    : Icons.search,
                onTap: () {
                  mainScreenNotifier.pageindex = 1;
                },
              ),
              BottomNavWidget(
                icon: mainScreenNotifier.pageindex == 2
                    ? Icons.add_circle
                    : Icons.add,
                onTap: () {
                  mainScreenNotifier.pageindex = 2;
                },
              ),
              BottomNavWidget(
                icon: mainScreenNotifier.pageindex == 3
                    ? Ionicons.cart
                    : Ionicons.cart_outline,
                onTap: () {
                  mainScreenNotifier.pageindex = 3;
                },
              ),
              BottomNavWidget(
                icon: mainScreenNotifier.pageindex == 4
                    ? Icons.person
                    : Icons.person_outline_outlined,
                onTap: () {
                  mainScreenNotifier.pageindex = 4;
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
