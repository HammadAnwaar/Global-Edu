// ignore_for_file: avoid_print, unused_local_variable, non_constant_identifier_names, use_build_context_synchronously, empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:globel_edu/my_colors.dart';
import 'package:globel_edu/views/home.dart';
import 'package:globel_edu/views/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var db = FirebaseFirestore.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SharedPreferences? pref;
  bool? newUser;
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColors.white,
          body: SingleChildScrollView(
            child: Form(
              key: globalKey,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                              height: 180,
                              width: double.infinity,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    "assets/images/global.jpg",
                                    fit: BoxFit.cover,
                                  ))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Sign in to your account",
                          style: TextStyle(
                            color: MyColors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter your email address",
                              suffixIcon: Icon(Icons.mail),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email.";
                            } else if (!value.contains("@")) {
                              return "Please enter valid email.";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.key),
                              hintText: "Enter your passsword",
                              counterText: '',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                          maxLength: 15,
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            } else if (value.length < 6) {
                              return "password must be atleast 6 digits";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 80),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.appColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12), // Adjust the value as needed
                              ),
                            ),
                            onPressed: () async {
                              if (globalKey.currentState!.validate()) {
                                try {
                                  setLogin();
                                  final userCredential = await FirebaseAuth
                                      .instance
                                      .signInWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then((value) =>
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const HomePage())));
                                  pref?.setString(
                                      "email", emailController.text);
                                  pref?.setString(
                                      "password", emailController.text);
                                } catch (e) {
                                  Fluttertoast.showToast(
                                    msg: 'Error: $e',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: MyColors.backgroundColor,
                                    textColor: MyColors.black,
                                    fontSize: 16.0,
                                  );
                                }
                              }
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  color: MyColors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "or",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 22, color: MyColors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Google",
                                      style: TextStyle(
                                          fontSize: 16, color: MyColors.black),
                                    ),
                                  )),
                              Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Facebook",
                                      style: TextStyle(
                                          fontSize: 16, color: MyColors.black),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an Account? ",
                                style: TextStyle(color: MyColors.lblack),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignupPage()));
                                },
                                child: Text(
                                  "Signup here",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: MyColors.black,
                                      decorationThickness: 1,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      color: MyColors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future<void> setLogin() async {
    var pref = await SharedPreferences.getInstance();
    pref.setString('userType', 'user');
  }
}
