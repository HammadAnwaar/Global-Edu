import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:global_edu/my_colors.dart';
import 'package:global_edu/views/dashboard.dart';
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
                          return "Name must contains 4 to 16 characters.";
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
                          return "Name must contains 4 to 16 characters.";
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
                          return "Please enter your email.";
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return "Please enter a valid email.";
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
                          return "Please enter your nationality.";
                        } else if (value.length < 4) {
                          return "Nationality must contain 4 to 16 characters.";
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
                      controller: numberController,
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
                      height: 10,
                    ),
                    Text(
                      "Enter your password",
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
                          hintText: "Password...",
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
                          return "Please enter your password.";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 to 12 characters.";
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
                          backgroundColor:
                              _isChecked ? MyColors.black : MyColors.lblack,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Adjust the value as needed
                          ),
                        ),
                        onPressed: _isChecked
                            ? () async {
                                if (globalKey.currentState!.validate()) {
                                  try {
                                    _saveDataFireStore();
                                    addDataInPref();
                                    setLogin();
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        )
                                        .then((value) =>
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Dashboard()),
                                            ));
                                    pref?.setString(
                                        "email", emailController.text);
                                    pref?.setString(
                                        "password", passwordController.text);
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
                              }
                            : () {},
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
    String gender = _selectedRadio == 0 ? 'Male' : 'Female';
    try {
      await userCollection.doc(userEmail).set({
        'firstName': firstNameC.text,
        'lastName': lastNameC.text,
        'email': userEmail!.toLowerCase(),
        'phone': numberController.text,
        'gender': gender,
        'nationality': nationalController.text,
        'password': passwordController.text,
      });
      print('User information and contacts saved successfully.');
    } catch (e) {
      print('Error saving user information and contacts: $e');
    }
  }

  Future<void> addDataInPref() async {
    pref = await SharedPreferences.getInstance();
    String gender = _selectedRadio == 0 ? 'Male' : 'Female';
    pref?.setString('firstname', firstNameC.text);
    pref?.setString('lastname', lastNameC.text);
    pref?.setString('nationality', nationalController.text);
    pref?.setString('phone', numberController.text);
    pref?.setString('email', emailController.text);
    pref?.setString('gender', gender.toString());
  }

  Future<void> setLogin() async {
    var pref = await SharedPreferences.getInstance();
    pref.setString('userType', 'user');
  }
}
