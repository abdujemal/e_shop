import 'package:e_shop/View/Widget/custom_button.dart';
import 'package:e_shop/View/Widget/input_layout.dart';
import 'package:e_shop/View/Widget/social_icon.dart';
import 'package:e_shop/View/controller/login_signUp_controller.dart';
import 'package:e_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailTc = TextEditingController();

  var passwordTc = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset(
            "assets/images/logo.png",
            width: 80,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Log in",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 25,
          ),
          Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InputLayout(
                    validation: (v) {
                      if (v!.isEmpty) {
                        return "This field is required";
                      } else if (!v.isEmail) {
                        return "Please write the correct email.";
                      }
                    },
                    leadingIcon: Icons.email,
                    type: TextInputType.emailAddress,
                    controller: emailTc,
                    title: 'Email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputLayout(
                    isObscure: true,
                    leadingIcon: Icons.lock,
                    type: TextInputType.text,
                    controller: passwordTc,
                    title: 'Password',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forget password?",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Obx(() {
              final controller = Get.find<LoginSignUpController>();
              if (controller.emailSignInState.value == RequestState.loading) {
                return const Center(
                  child: CircularProgressIndicator(color: primaryColor),
                );
              }
              return CustomButton(
                  text: "Log in",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      controller.signInWithEmailnPassword(
                          emailTc.text, passwordTc.text);
                    }
                  });
            }),
          ),
          const SizedBox(
            height: 30,
          ),
          buildOr(),
          socialIcons(),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  buildOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(
          width: 100,
          child: Divider(
            color: Colors.grey,
            endIndent: 20,
            indent: 20,
            height: 6,
            // thickness: 50,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("or"),
        ),
        SizedBox(
          width: 100,
          child: Divider(
            color: Colors.grey,
            endIndent: 20,
            indent: 20,
            height: 6,
            // thickness: 50,
          ),
        )
      ],
    );
  }

  socialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetBuilder<LoginSignUpController>(
          builder: (controller) {
            if (controller.googleSignUpState.value == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(color: primaryColor),
              );
            }
            return SocialIcon(
                icon: FontAwesomeIcons.google,
                iconColor: primaryColor,
                onTap: () {
                  controller.googleSignUp(null, null, null, null);
                });
          },
        ),
        const SizedBox(
          width: 15,
        ),
        GetBuilder<LoginSignUpController>(builder: (controller) {
          if (controller.facebookSignUpState.value == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(color: primaryColor),
            );
          }
          return SocialIcon(
              icon: Icons.facebook,
              iconColor: Colors.blue,
              onTap: () {
                controller.facebookSignUp(null, null, null, null);
              });
        })
      ],
    );
  }
}
