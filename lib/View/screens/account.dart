import 'package:e_shop/View/Widget/custom_button.dart';
import 'package:e_shop/View/Widget/input_layout.dart';
import 'package:e_shop/View/Widget/svg_bg.dart';
import 'package:e_shop/View/controller/login_signUp_controller.dart';
import 'package:e_shop/View/screens/notifications.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/View/controller/MainController.dart';
import 'package:e_shop/data/models/user_model.dart';
import 'package:e_shop/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller/order_controller.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool isEditing = false;

  OrderController orderController = Get.put(di<OrderController>());

  var setUserKey = GlobalKey<FormState>();

  var emailTc = TextEditingController();

  var userTc = TextEditingController();

  var phoneTc = TextEditingController();

  var locationTc = TextEditingController();

  var zipCodeTc = TextEditingController();

  LoginSignUpController loginSignUpController =
      Get.put(di<LoginSignUpController>());

  MainController mainController = Get.put(di<MainController>());

  @override
  void initState() {
    super.initState();

    UserModel userModel = loginSignUpController.currentUser.value;

    emailTc.text = userModel.email;
    userTc.text = userModel.name;
    phoneTc.text = userModel.phoneNumber;
    locationTc.text = userModel.location;
    zipCodeTc.text = userModel.zipCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            mainController.z.value.toggle!();
          },
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/Notification.svg"),
            onPressed: () {
              Get.to(() => const Notifications());
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 200,
            child: CustomPaint(
              size: Size(
                (double.infinity * 0.6666666666666666).toDouble(),
                200,
              ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter(),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 7),
                child: Obx(() {
                  UserModel userModel = loginSignUpController.currentUser.value;
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: userModel.img.isEmpty
                            ? null
                            : NetworkImage(userModel.img),
                        child: userModel.img.isEmpty
                            ? const Icon(Icons.person)
                            : null,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        userModel.name,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(userModel.email,
                          style: const TextStyle(fontSize: 12)),
                      const SizedBox(
                        height: 15,
                      ),
                      cards(),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: title("Personal Information"),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  isEditing = !isEditing;
                                });
                              },
                              icon: isEditing
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    )
                                  : const Icon(Icons.edit))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      isEditing
                          ? personalInfoEditing(loginSignUpController)
                          : presonalInformations(userModel)
                    ],
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }

  personalInfoEditing(LoginSignUpController controller) {
    return Form(
        key: setUserKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
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
            controller.setUserState.value == RequestState.loading
                ? const Center(
                    child: CircularProgressIndicator(color: primaryColor),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: CustomButton(
                        text: "Save Changes",
                        onTap: () {
                          if (setUserKey.currentState!.validate()) {
                            controller.setUser(emailTc.text, phoneTc.text,
                                locationTc.text, userTc.text, zipCodeTc.text);
                          }
                        }),
                  )
          ],
        ));
  }

  presonalInformations(UserModel userModel) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 5, 5, 10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 227, 227, 227)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        singleInfo("Name :", userModel.name),
        singleInfo("Email :", userModel.email),
        singleInfo("Location :", userModel.location),
        singleInfo("Zip Code :", userModel.zipCode),
        singleInfo("Phone Number :", userModel.phoneNumber),
      ]),
    );
  }

  singleInfo(String key, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(key),
          Text(
            value,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.black),
          )
        ],
      ),
    );
  }

  cards() {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          singleCard(Icons.local_shipping_rounded, "Progress order", "${orderController.orders.length}",
              primaryColor),
          singleCard(Icons.code_rounded, "Promocode", "3098", Colors.blue),
          singleCard(Icons.star, "Reviews", "4.5k", Colors.amber)
        ],
      ),
    );
  }

  title(String s) {
    return Text(
      s,
      textAlign: TextAlign.start,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
    );
  }

  singleCard(IconData icon, String title, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 0),
                  spreadRadius: 10,
                  blurRadius: 30,
                  color: Colors.black.withAlpha(10))
            ]),
        child: SizedBox(
          width: 113,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: color.withAlpha(20)),
                  child: Icon(
                    icon,
                    size: 30,
                    color: color,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
