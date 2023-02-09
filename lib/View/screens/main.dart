import 'package:e_shop/View/Widget/drawer.dart';
import 'package:e_shop/View/controller/order_controller.dart';
import 'package:e_shop/View/screens/aboutus.dart';
import 'package:e_shop/View/screens/addresses.dart';
import 'package:e_shop/View/screens/explore.dart';
import 'package:e_shop/View/screens/myOrder.dart';
import 'package:e_shop/View/screens/privacy_policy.dart';
import 'package:e_shop/View/screens/settings.dart';
import 'package:e_shop/View/controller/MainController.dart';
import 'package:e_shop/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../controller/address_controller.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  var tabs = [
    const Explore(),
    const AddressesPage(),
    const MyOrders(),
    const AboutUs(),
    const PrivacyPolicy(),
    const Settings()
  ];

  MainController mainController = Get.put(di<MainController>());
  AddressController addressController = Get.put(di<AddressController>());
  OrderController orderController = Get.put(di<OrderController>());

  @override
  void initState() {
    super.initState();
    mainController.getProducts();
    addressController.getAddress();
    orderController.getOrder();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        controller: mainController.z.value,
        borderRadius: 24,
        style: DrawerStyle.defaultStyle,
        // showShadow: true,
        menuScreenWidth: 280,
        boxShadow: [
          BoxShadow(
              color: primaryColor.withAlpha(15),
              blurRadius: 30,
              spreadRadius: 30,
              offset: const Offset(0, 4))
        ],
        openCurve: Curves.fastOutSlowIn,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        duration: const Duration(milliseconds: 500),
        angle: 0.0,
        menuBackgroundColor: bgLight,
        mainScreen: GetBuilder<MainController>(
            builder: (controller) => tabs[controller.mainMenuIndex.value]),
        menuScreen: const MyDrawer());
  }
}
