import 'package:e_shop/View/Widget/custom_button.dart';
import 'package:e_shop/View/screens/main.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/View/controller/MainController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            checkedIcon(),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Congratulations!!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Payment is the transfer of money sevices in exchange product or Payments",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CustomButton(
                text: "Get your receipt",
                onTap: () {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<MainController>(
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: CustomButton(
                    textColor: primaryColor,
                    btnColor: const Color.fromARGB(255, 255, 225, 216),
                    text: "Back to Home",
                    onTap: () {
                      controller.cartList.value = [];
                      controller.subTotal.value = 0;
                      controller.exploreMenuIndex.value = 0;
                      Get.back();
                    },
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  checkedIcon() {
    return const Center(
      child: Card(
        color: primaryColor,
        shape: CircleBorder(),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            color: bgColor,
            shape: CircleBorder(),
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Card(
                  shape: CircleBorder(),
                  color: Color.fromARGB(255, 255, 225, 216),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.check_rounded,
                        color: primaryColor,
                        size: 60,
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
