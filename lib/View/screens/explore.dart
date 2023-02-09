import 'package:e_shop/View/screens/account.dart';
import 'package:e_shop/View/screens/cart.dart';
import 'package:e_shop/View/screens/favourites.dart';
import 'package:e_shop/View/screens/home_screen.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/View/controller/MainController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  var tabs = [const HomeScreen(), const Cart(), const Favourites(), const Account()];

  var menus = [
    const BottomNavigationBarItem(activeIcon: Icon(Icons.home_rounded,), label: "Home", icon: Icon(Icons.home_outlined)),
    const BottomNavigationBarItem(activeIcon: Icon(Icons.shopping_bag,), label: "Cart", icon: Icon(Icons.shopping_bag_outlined)),
    const BottomNavigationBarItem(activeIcon: Icon(Icons.favorite,), label: "Favourite", icon: Icon(Icons.favorite_outline_rounded)),
    const BottomNavigationBarItem(activeIcon: Icon(Icons.account_circle,), label: "Profile", icon: Icon(Icons.account_circle_outlined))
  ];

  bottomNav(MainController controller){
    return BottomNavigationBar(
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          currentIndex: controller.exploreMenuIndex.value,
          items: menus,
          onTap: (value) {
            controller.setExploreMenuIndex(value);
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: tabs[controller.exploreMenuIndex.value],
          bottomNavigationBar: bottomNav(controller),
        ),
      );
    });
  }
}
