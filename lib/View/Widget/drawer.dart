import 'package:e_shop/View/Widget/menu_card.dart';
import 'package:e_shop/View/controller/login_signUp_controller.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/View/controller/MainController.dart';
import 'package:e_shop/data/models/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List<Menu> menus = [
    Menu(name: "Explore", icon: Icons.explore),
    Menu(name: "My Addresses", icon: Icons.location_on),
    Menu(name: "My orders", icon: Icons.delivery_dining),
    Menu(name: "About us", icon: Icons.info),
    Menu(name: "Privacy policy", icon: Icons.security),
    Menu(name: "Settings", icon: Icons.settings)
  ];

  appBar() {
    return GetBuilder<LoginSignUpController>(builder: (controller) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: controller.currentUser.value.img.isEmpty
                ? null
                : NetworkImage(controller.currentUser.value.img),
            radius: 30,
            child: controller.currentUser.value.img.isEmpty
                ? const Icon(Icons.person)
                : null,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.currentUser.value.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20)),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Fashion Designer",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.keyboard_arrow_right,
            size: 45,
          )
        ],
      );
    });
  }

  menuList() {
    return Obx(() {
      return Column(
        children: List.generate(
            menus.length,
            (index) => MenuCard(
                  menu: menus[index],
                  isActive:
                      Get.find<MainController>().mainMenuIndex.value == index,
                  onTap: () =>
                      Get.find<MainController>().setMainMenuIndex(index),
                )),
      );
    });
  }

  logoutBtn() => Obx(() {
        final controller = Get.find<LoginSignUpController>();
        if (controller.signOutState.value == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(color: primaryColor),
          );
        }
        return MenuCard(
            menu: Menu(name: "Log out", icon: Icons.logout),
            isActive: true,
            onTap: () {
              controller.signOut();
            });
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(),
            Spacer(),
            menuList(),
            Spacer(),
            logoutBtn(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 18),
              child: Image.asset(
                'assets/images/logo.png',
                height: 70,
              ),
            )
          ],
        ),
      ),
    );
  }
}
