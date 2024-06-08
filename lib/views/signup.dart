// ignore_for_file: avoid_print, unused_local_variable, non_constant_identifier_names, use_build_context_synchronously, empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:globel_edu/my_colors.dart';
import 'package:globel_edu/views/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var db = FirebaseFirestore.instance;
  TextEditingController firstNameC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  TextEditingController nationalController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isChecked = false;
  SharedPreferences? pref;
  int _selectedRadio = 0;
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create Account",
                      style: TextStyle(
                        color: MyColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Welcom to ",
                          style: TextStyle(color: MyColors.lblack),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Icon(
                          Icons.circle,
                          color: MyColors.lblack,
                          size: 8,
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Text(
                          "Enter your full",
                          style: TextStyle(color: MyColors.lblack),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Divider(
                      color: MyColors.lblack,
                    ),
                    const Text(
                      "Enter your phone number",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Enter your email address",
                      style: TextStyle(fontSize: 16, color: MyColors.lblack),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      cursorColor: MyColors.black,
                      maxLength: 16,
                      decoration: InputDecoration(
                          hintText: "First Name",
                          counterText: '',
                          fillColor: MyColors.backgroundColor,
                          filled: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)))),
                      controller: firstNameC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name.";
                        } else if (value.length < 4) {
                          return "Name must contains 4 to 16 chracters.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      cursorColor: MyColors.black,
                      maxLength: 16,
                      decoration: InputDecoration(
                          hintText: "Last Name",
                          counterText: '',
                          fillColor: MyColors.backgroundColor,
                          filled: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)))),
                      controller: lastNameC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name.";
                        } else if (value.length < 4) {
                          return "Name must contains 4 to 16 chracters.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      cursorColor: MyColors.black,
                      decoration: InputDecoration(
                          hintText: "Email...",
                          counterText: '',
                          fillColor: MyColors.backgroundColor,
                          filled: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)))),
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name.";
                        } else if (value.length < 8) {
                          return "Name must contains 8 to chracters.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Select your gender",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 0,
                          groupValue: _selectedRadio,
                          activeColor: MyColors.black,
                          onChanged: (value) {
                            setState(() {
                              _selectedRadio = value!;
                            });
                          },
                        ),
                        const Text('Male'),
                        const SizedBox(
                            width: 20), // Add spacing between the radio buttons
                        Radio(
                          value: 1,
                          activeColor: MyColors.black,
                          groupValue: _selectedRadio,
                          onChanged: (value) {
                            setState(() {
                              _selectedRadio = value!;
                            });
                          },
                        ),
                        const Text('Female'),
                      ],
                    ),
                    Text(
                      "Select your nationality",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: MyColors.black),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      cursorColor: MyColors.black,
                      maxLength: 16,
                      decoration: InputDecoration(
                          hintText: "Nationality...",
                          counterText: '',
                          fillColor: MyColors.backgroundColor,
                          filled: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)))),
                      controller: nationalController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name.";
                        } else if (value.length < 4) {
                          return "Name must contains 4 to 16 chracters.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Enter your phone number",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: MyColors.black),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      cursorColor: MyColors.black,
                      maxLength: 16,
                      decoration: InputDecoration(
                          hintText: "Mobile Number...",
                          counterText: '',
                          fillColor: MyColors.backgroundColor,
                          filled: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)))),
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your number.";
                        } else if (value.length < 11) {
                          return "Please enter a valid number.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    CheckboxListTile(
                      title: const Text(
                        'I have read and agree to the terms and conditions.',
                        style: TextStyle(fontSize: 14),
                      ),
                      controlAffinity: ListTileControlAffinity
                          .leading, // Align the checkbox to the leading edge of the ListTile
                      value: _isChecked,
                      checkColor: MyColors.black,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Adjust the value as needed
                          ),
                        ),
                        onPressed: () async {
                          if (globalKey.currentState!.validate()) {
                            try {
                              _saveDataFireStore();
                              addDataInPref();
                              setLogin();
                              final userCredential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text)
                                  .then((value) => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Dashboard())));
                              pref?.setString("email", emailController.text);
                              pref?.setString("password", emailController.text);
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
                          "Create Account",
                          style: TextStyle(
                              color: MyColors.white,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Future<void> _saveDataFireStore() async {
    final user = FirebaseAuth.instance.currentUser;
    String? userEmail = user != null ? user.email : emailController.text;
    final CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users');
    try {
      await userCollection.doc(userEmail).set({
        'firstName': firstNameC.text,
        'lastName': lastNameC.text,
        'email': userEmail!.toLowerCase(),
        'phone': numberController.text,
        'gender': numberController.text,
        'password': passwordController.text,
      });
      print('User information and contacts saved successfully.');
    } catch (e) {
      print('Error saving user information and contacts: $e');
    }
  }

  Future<void> addDataInPref() async {
    pref = await SharedPreferences.getInstance();
    pref?.setString("name", firstNameC.text);
    pref?.setString("phone", lastNameC.text);
    pref?.setString("email", emailController.text);
    pref?.setString("guardian", numberController.text);
    pref?.setString("password", passwordController.text);
  }

  Future<void> setLogin() async {
    var pref = await SharedPreferences.getInstance();
    pref.setString('userType', 'user');
  }
}
