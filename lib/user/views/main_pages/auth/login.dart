import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:global_edu/admin/home.dart';
import 'package:global_edu/constants/my_colors.dart';
import 'package:global_edu/user/views/dashboard.dart';
import 'package:global_edu/user/views/main_pages/auth/forgot_password.dart';
import 'package:global_edu/user/views/main_pages/auth/signup.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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
  bool hide = true;
  final globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadSharedPreferences();
  }

  Future<void> _loadSharedPreferences() async {
    pref = await SharedPreferences.getInstance();
  }

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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
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
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
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
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email.";
                          } else if (!value.contains("@")) {
                            return "Please enter a valid email.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        obscureText: hide,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hide = !hide;
                              });
                            },
                            icon: hide
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                          hintText: "Enter your password",
                          counterText: '',
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        maxLength: 15,
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password.";
                          } else if (value.length < 6) {
                            return "Password must be at least 6 characters.";
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 12),
                          child: GestureDetector(
                            child: const Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: MyColors.appColor,
                                  decorationThickness: 1,
                                  decorationStyle: TextDecorationStyle.solid,
                                  color: MyColors.appColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ForgotPasswordScreen()));
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.appColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
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
                                } else {
                                  await setLogin();
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then((value) =>
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const Dashboard())));
                                }
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
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: MyColors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          "or",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22, color: MyColors.black),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  await signInWithGoogle();
                                },
                                child: const Text(
                                  "Google",
                                  style: TextStyle(
                                      fontSize: 16, color: MyColors.black),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  try {
                                    await signInWithFacebook();
                                    if (context.mounted) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const Dashboard()));
                                    }
                                  } catch (e) {
                                    Fluttertoast.showToast(msg: "$e");
                                  }
                                },
                                child: const Text(
                                  "Facebook",
                                  style: TextStyle(
                                      fontSize: 16, color: MyColors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an Account? ",
                              style: TextStyle(color: MyColors.lblack),
                            ),
                            GestureDetector(
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Signup here",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: MyColors.black,
                                  decorationThickness: 1,
                                  decorationStyle: TextDecorationStyle.solid,
                                  color: MyColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser == null) {
        // The user canceled the sign-in
        Fluttertoast.showToast(
          msg: 'Google sign-in canceled',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: MyColors.backgroundColor,
          textColor: MyColors.black,
          fontSize: 16.0,
        );
        return;
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      await setLogin();
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        Fluttertoast.showToast(
          msg: 'Google sign-in successful: ${user.email}',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: MyColors.backgroundColor,
          textColor: MyColors.black,
          fontSize: 16.0,
        );
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Dashboard()));
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Google sign-in failed: $e',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: MyColors.backgroundColor,
        textColor: MyColors.black,
        fontSize: 16.0,
      );
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      await setLogin();
      return await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
    } catch (e) {
      throw Exception('Facebook sign-in failed: $e');
    }
  }

  Future<void> setLogin() async {
    if (pref != null) {
      pref!.setBool('isLogin', true);
      pref!.setString('userType', 'user');
    }
  }
}
