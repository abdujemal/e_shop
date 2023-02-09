import 'package:e_shop/View/screens/notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller/MainController.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "About Us",
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
        leading: GetBuilder<MainController>(
          builder: (controller) {
            return IconButton(
              onPressed: () {
                controller.z.value.toggle!();
              },
              icon: SvgPicture.asset("assets/icons/menu.svg"),
            );
          }
        ),
      ),
    );
  }
}
