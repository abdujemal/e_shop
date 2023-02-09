import 'package:e_shop/View/Widget/order_card.dart';
import 'package:e_shop/View/controller/order_controller.dart';
import 'package:e_shop/View/screens/notifications.dart';
import 'package:e_shop/View/controller/MainController.dart';
import 'package:e_shop/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../injection.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  OrderController orderController = Get.put(OrderController(di(), di()));

  @override
  void initState() {
    super.initState();
    orderController.getOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Order",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/Notification.svg"),
            onPressed: () {
              Get.to(() => const Notifications());
            },
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Get.find<MainController>().z.value.toggle!();
          },
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ),
      ),
      body: GetBuilder<OrderController>(
        builder: (controller) {
          if (controller.orderState.value == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(color: primaryColor),
            );
          }
          return ListView.builder(
            itemCount: controller.orders.length,
            itemBuilder: (context, index) {
              return OrderCard(
                order: controller.orders[index],
              );
            },
          );
        },
      ),
    );
  }
}
