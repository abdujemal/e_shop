import 'package:e_shop/View/Widget/Setting_card.dart';
import 'package:e_shop/View/screens/notifications.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/View/controller/MainController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isNotifactionOn = false;
  bool isDarkModeOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SettingCard(icon: Icons.email, title: "Email Support"),
            SizedBox(
              height: 10,
            ),
            SettingCard(icon: Icons.question_answer, title: "FAQ"),
            SizedBox(
              height: 10,
            ),
            SettingCard(icon: Icons.lock, title: "Privacy Statement"),
            SizedBox(
              height: 10,
            ),
            SettingCard(
              icon: Icons.notifications,
              title: "Notifications",
              trailing: SizedBox(
                width: 50.0,
                height: 30.0,
                child: FlutterSwitch(
                  activeColor: primaryColor,
                  valueFontSize: 13.0,
                  borderRadius: 30.0,
                  onToggle: (v) {
                    setState(() {
                      isNotifactionOn = v;
                    });
                  },
                  value: isNotifactionOn,
                ),
              ),
            ),
            SettingCard(
              icon: Icons.dark_mode,
              title: "Dark Mode",
              trailing: SizedBox(
                width: 50.0,
                height: 30.0,
                child: FlutterSwitch(
                  activeColor: primaryColor,
                  valueFontSize: 13.0,
                  borderRadius: 30.0,
                  onToggle: (v) {
                    setState(() {
                      isDarkModeOn = v;
                      // Get.changeTheme(isDarkModeOn ? ThemeData.dark(): ThemeData.light());
                    });
                  },
                  value: isDarkModeOn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
