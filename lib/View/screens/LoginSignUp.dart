import 'package:e_shop/View/Widget/login.dart';
import 'package:e_shop/View/Widget/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginSignUp extends StatefulWidget {
  const LoginSignUp({Key? key}) : super(key: key);

  @override
  State<LoginSignUp> createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isLogin ? const Login() : const SignUp(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(isLogin
                    ? "Don't have an account?"
                    : "Already have an account?"),
                TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: Text(
                      isLogin ? "SignUp" : "Login",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    )),
                
              ],
            ),
            const SizedBox(
                  height: 40,
                )
          ],
        ),
      ),
    );
  }
}
