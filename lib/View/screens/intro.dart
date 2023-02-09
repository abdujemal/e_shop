import 'package:e_shop/View/Widget/intro_card.dart';
import 'package:e_shop/View/screens/LoginSignUp.dart';
import 'package:e_shop/View/screens/main.dart';
import 'package:e_shop/data/models/intro_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  var introTabs = [
    IntroItem(
        "A product is the item offered for sale can be a service or an item. It can be physical or in virtual or cyber form",
        "assets/images/splash1.jpg",
        "Choose Product"),
    IntroItem(
        "Payment is the transfer of money services in exchange product or Payments typically made terms agreed",
        "assets/images/splash2.jpg",
        "Make Payment"),
    IntroItem(
        "Business or commerce an order is a stated intention either spoken to engage in a commercial transaction specific products",
        'assets/images/splash1.png',
        "Get Your Order")
  ];

  var pgController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: pgController,
          itemCount: introTabs.length,
          itemBuilder: ((context, index) {
            return IntroCard(
              index: index,
              length: introTabs.length,
              introItem: introTabs[index],
              onBtnTap: () {
                if (index == introTabs.length - 1) {
                  Get.offAll(() => const LoginSignUp());
                } else {
                  pgController.animateToPage(index + 1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                }
              },
            );
          })),
    );
  }
}
