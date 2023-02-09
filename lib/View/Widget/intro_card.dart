import 'package:e_shop/View/Widget/custom_button.dart';
import 'package:e_shop/View/screens/LoginSignUp.dart';
import 'package:e_shop/View/screens/main.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/data/models/intro_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class IntroCard extends StatefulWidget {
  final IntroItem introItem;
  final int index;
  final int length;
  final Function onBtnTap;
  const IntroCard(
      {super.key,
      required this.onBtnTap,
      required this.introItem,
      required this.index,
      required this.length});

  @override
  State<IntroCard> createState() => _IntroCardState();
}

class _IntroCardState extends State<IntroCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
      child: Column(
        children: [
          top(),
          const Spacer(),
          Image.asset(
            widget.introItem.asset,
            width: double.infinity,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.introItem.title,
            style: const TextStyle(
                color: Colors.black, fontSize: 21, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              widget.introItem.text,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomButton(
              trailing: Row(children: icons(widget.index + 1)),
              text: widget.index == widget.length - 1 ? "Get Started" : "Next",
              onTap: () => widget.onBtnTap(),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }

  top() {
    return Row(
      children: [
        Text(
          "${widget.index + 1}/${widget.length}",
          style: const TextStyle(color: Colors.black),
        ),
        const Spacer(),
        TextButton(
            onPressed: () {
              Get.offAll(() => const LoginSignUp());
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: Colors.black),
            ))
      ],
    );
  }

  icons(iconNum) {
    // generate icons that are equal to the index+1
    return List.generate(
        iconNum,
        (index) => Text(
              ">",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                  color: index == iconNum-1
                      ? Colors.white:
                      const Color.fromARGB(146, 255, 255, 255)),
            ));
  }
}
