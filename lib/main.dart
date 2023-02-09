import 'package:e_shop/View/screens/main.dart';
import 'package:e_shop/View/screens/search_page.dart';
import 'package:e_shop/View/screens/splash.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/View/controller/bindings.dart';
import 'package:e_shop/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'View/controller/MainController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await Firebase.initializeApp();

  // injection is being done
  di_setUp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // static MainController mainController = Get.put(MainController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: di<Bindings>(),
        debugShowCheckedModeBanner: false,
        title: 'E-Shopp',
        theme: ThemeData(
          canvasColor: Colors.white,
          scaffoldBackgroundColor: bgColor,
          primarySwatch: Colors.blue,
          fontFamily: "Gordita",
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          textTheme: const TextTheme(
            bodyText2: TextStyle(color: Colors.black54),
          ),
        ),
        home: const Splash());
  }
}
