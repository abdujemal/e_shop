import 'dart:io';

import 'package:e_shop/View/Widget/custom_button.dart';
import 'package:e_shop/View/Widget/input_layout.dart';
import 'package:e_shop/View/Widget/social_icon.dart';
import 'package:e_shop/View/controller/login_signUp_controller.dart';
import 'package:e_shop/View/screens/LoginSignUp.dart';
import 'package:e_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailTc = TextEditingController();

  var passwordTc = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var confirmPasswordTc = TextEditingController();

  var userTc = TextEditingController();

  var phoneTc = TextEditingController();

  var locationTc = TextEditingController();

  var zipCodeTc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Image.asset(
          "assets/images/logo.png",
          width: 80,
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Sign Up",
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
                GetBuilder<LoginSignUpController>(builder: (controller) {
                  if (controller.registerImg.value.path != "") {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          controller.setImage();
                        },
                        child: CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 50,
                          backgroundImage:
                              FileImage(controller.registerImg.value),
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          controller.setImage();
                        },
                        child: CircleAvatar(
                          backgroundColor: primaryColor.withOpacity(0.16),
                          radius: 50,
                          child: const Icon(
                            Icons.person,
                            color: primaryColor,
                            size: 60,
                          ),
                        ),
                      ),
                    );
                  }
                }),
                const SizedBox(
                  height: 10,
                ),
                InputLayout(
                  validation: (v) {
                    if (v!.isEmpty) {
                      return "This field is required.";
                    } else if (!v.isEmail) {
                      return "Please write the correct email.";
                    }
                  },
                  leadingIcon: Icons.email_outlined,
                  type: TextInputType.emailAddress,
                  controller: emailTc,
                  title: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                InputLayout(
                  leadingIcon: Icons.perm_identity,
                  type: TextInputType.text,
                  controller: userTc,
                  title: 'User name',
                ),
                const SizedBox(
                  height: 10,
                ),
                InputLayout(
                  leadingIcon: Icons.phone,
                  type: TextInputType.phone,
                  controller: phoneTc,
                  title: 'Phone Number',
                ),
                const SizedBox(
                  height: 10,
                ),
                InputLayout(
                  leadingIcon: Icons.location_on_outlined,
                  type: TextInputType.text,
                  controller: locationTc,
                  title: 'Location',
                ),
                const SizedBox(
                  height: 10,
                ),
                InputLayout(
                  leadingIcon: Icons.numbers,
                  type: TextInputType.number,
                  controller: zipCodeTc,
                  title: 'Zip Code',
                ),
                const SizedBox(
                  height: 10,
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
                InputLayout(
                  isObscure: true,
                  leadingIcon: Icons.lock,
                  type: TextInputType.text,
                  controller: confirmPasswordTc,
                  title: 'Confirm password',
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
          child: GetBuilder<LoginSignUpController>(builder: (controller) {
            if (controller.emailSignUpState.value == RequestState.loading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: primaryColor,
              ));
            }
            return CustomButton(
                text: "Sign Up",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    if (controller.registerImg.value.path == "") {
                      controller.signUpWithEmailnPassword(
                          emailTc.text,
                          passwordTc.text,
                          userTc.text,
                          phoneTc.text,
                          locationTc.text,
                          zipCodeTc.text,
                          controller.registerImg.value);
                    } else {
                      toast("Please choose your image.", ToastType.error);
                    }
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
                  if (formKey.currentState!.validate()) {
                    controller.googleSignUp(userTc.text, phoneTc.text,
                        locationTc.text, zipCodeTc.text);
                  }
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
                if (formKey.currentState!.validate()) {
                  controller.facebookSignUp(userTc.text, phoneTc.text,
                      locationTc.text, zipCodeTc.text);
                }
              });
        })
      ],
    );
  }
}
