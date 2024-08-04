// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:global_edu/login_option.dart';
import 'package:global_edu/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginOption()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Column(
        children: [
          Expanded(child: Container()),
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  "assets/images/app_logo.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Global Edu",
            style: TextStyle(
                color: MyColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
                decorationThickness: 2),
          ),
          Expanded(child: Container()),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 38,
                vertical: 20,
              ),
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                color: MyColors.appColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
  }
