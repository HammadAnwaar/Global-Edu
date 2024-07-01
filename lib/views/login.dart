import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:global_edu/my_colors.dart';
import 'package:global_edu/views/dashboard.dart';
import 'package:global_edu/views/signup.dart';
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
  bool? newUser;
  bool hide = true;
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
                            return "Please enter valid email.";
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
                          hintText: "Enter your passsword",
                          counterText: '',
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        maxLength: 15,
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
                                setLogin();
                                final userCredential = await FirebaseAuth
                                    .instance
                                    .signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text)
                                    .then((value) => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const Dashboard())));
                                pref?.setString("email", emailController.text);
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
                                onPressed: () {
                                  signInWithGoogle();
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
                                onPressed: () {
                                  // signInWithFacebook();
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

  signInWithGoogle() async {
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

      setLogin();
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        // Print user email
        print('User email: ${user.email}');
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
          context,
          MaterialPageRoute(builder: (_) => const Dashboard()),
        );
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

  // signInWithFacebook() async {
  //   final LoginResult result = await FacebookAuth.instance.login();

  //   if (result.status == LoginStatus.success) {
  //     final AccessToken? accessToken = result.accessToken;
  //     final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken?.token);

  //     setLogin();
  //     return await FirebaseAuth.instance
  //         .signInWithCredential(facebookAuthCredential)
  //         .then((value) => Navigator.pushReplacement(
  //             context, MaterialPageRoute(builder: (_) => const Dashboard())));
  //   } else {
  //     Fluttertoast.showToast(
  //       msg: 'Facebook login failed: ${result.status}',
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: MyColors.backgroundColor,
  //       textColor: MyColors.black,
  //       fontSize: 16.0,
  //     );
  //   }
  // }

  Future<void> setLogin() async {
    var pref = await SharedPreferences.getInstance();
    pref.setString('userType', 'user');
  }
}
