import 'package:e_shop/View/controller/login_signUp_controller.dart';
import 'package:e_shop/View/screens/intro.dart';
import 'package:e_shop/View/screens/main.dart';
import 'package:e_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  LoginSignUpController controller = Get.find<LoginSignUpController>();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      controller.getUesr();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 160,
              ),
              const SizedBox(
                height: 10,
              ),
              const CircularProgressIndicator(
                color: primaryColor,
              )
            ],
          ),
        ));
  }
}
