import 'package:e_shop/View/Widget/cart_card.dart';
import 'package:e_shop/View/Widget/custom_button.dart';
import 'package:e_shop/View/screens/checkout.dart';
import 'package:e_shop/View/screens/notifications.dart';
import 'package:e_shop/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller/MainController.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  MainController mainController = Get.put(di<MainController>());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            mainController.z.value.toggle!();
          },
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ),
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/Notification.svg"),
            onPressed: () {
              Get.to(() => const Notifications());
            },
          ),
        ],
      ),
      body: mainController.cartList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/empty_cart.png"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Empty Cart",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            )
          : Column(
              children: [
                Flexible(
                  flex: 8,
                  child: GetBuilder<MainController>(builder: (controller) {
                    return ListView.builder(
                        itemCount: controller.cartList.length,
                        itemBuilder: ((context, index) {
                          return CartCard(
                            cart: controller.cartList[index],
                            onIncreament: () {
                              controller.cartList[index].quantity++;
                              controller.calculate();
                            },
                            onDecrement: () {
                              if (controller
                                      .cartList[index]
                                      .quantity ==
                                  1) {
                                controller.cartList.removeAt(index);
                              } else {
                                controller.cartList[index].quantity--;
                              }
                              controller.calculate();
                            },
                          );
                        }));
                  }),
                ),
                Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Subtotal  :"),
                              const Spacer(),
                              Obx(() {
                                return Text(
                                  "\$${mainController.subTotal}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                );
                              })
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CustomButton(
                              text: "Checkout",
                              onTap: () {
                                Get.to(() => const CheckOut());
                              }),
                        )
                      ],
                    ))
              ],
            ),
    );
  }
}
