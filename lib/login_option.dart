import 'package:flutter/material.dart';
import 'package:global_edu/admin/admin_login.dart';
import 'package:global_edu/constants/my_colors.dart';
import 'package:global_edu/user/views/dashboard.dart';
import 'package:global_edu/user/views/main_pages/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginOption extends StatefulWidget {
  const LoginOption({super.key});

  @override
  State<LoginOption> createState() => _LoginOptionState();
}

class _LoginOptionState extends State<LoginOption> {
  SharedPreferences? pref;
  String? userType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: double.infinity,
              height: 55,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.appColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          12), // Adjust the value as needed
                    ),
                  ),
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AdminLogin()));
                  },
                  child: const Text(
                    "Login As Admin",
                    style: TextStyle(color: MyColors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.appColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          12), // Adjust the value as needed
                    ),
                  ),
                  onPressed: () async {
                    pref = await SharedPreferences.getInstance();
                    userType = pref!.getString('userType');
                    if (userType == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const Dashboard()),
                      );
                    }
                  },
                  child: const Text(
                    "Login As User",
                    style: TextStyle(color: MyColors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
