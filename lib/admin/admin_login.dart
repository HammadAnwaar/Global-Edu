// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:global_edu/admin/home.dart';
import 'package:global_edu/constants/auth_textfield.dart';
import 'package:global_edu/constants/my_button.dart';
import 'package:global_edu/constants/my_colors.dart';

class AdminLogin extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: AppBar(
          backgroundColor: MyColors.appColor,
          title: const Text(
            "Login as Admin",
            style: TextStyle(color: MyColors.white),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: MyColors.white,
              )),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.3,
                  width: screenHeight * 0.3,
                  child: Image.asset("assets/images/app_logo.png"),
                ),
                SizedBox(height: screenHeight * 0.05),
                AuthTextField(
                  hintText: "Email...",
                  obsecureText: false,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter admin email';
                    } else if (value == "admin") {
                      return "enter a valid email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                AuthTextField(
                  hintText: "Password...",
                  obsecureText: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    } else if (value.length < 6) {
                      return "password must be at least 6 digits";
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      if (globalKey.currentState!.validate()) {
                        try {
                          if (emailController.text ==
                                  "Info.mustaghistech@gmail.com" &&
                              passwordController.text == "D<*dD84D") {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const AdminHome(),
                              ),
                            );
                          }
                        } catch (e) {
                          print("Error is $e");
                        }
                      }
                    },
                    child: const MyButton(
                      text: 'Login',
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
