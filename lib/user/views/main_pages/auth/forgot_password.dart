import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:global_edu/constants/my_colors.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  ForgotPasswordScreen({super.key});

  void _resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text,
      );
      // Show a success message or navigate to a success screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password reset email sent"),
        ),
      );
    } catch (e) {
      // Show an error message if something goes wrong
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: ${e.toString()}"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: MyColors.white,
            )),
        backgroundColor: MyColors.appColor,
        title: const Text(
          'Forgot Password',
          style: TextStyle(color: MyColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              cursorColor: MyColors.black,
              style: const TextStyle(color: MyColors.black, fontSize: 16),
              decoration: const InputDecoration(
                  fillColor: MyColors.backgroundColor,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  hintText: "Email",
                  hintStyle: TextStyle(color: MyColors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors.black),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  hoverColor: MyColors.black,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors.black),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  )),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: MyColors.appColor),
                  onPressed: () => _resetPassword(context),
                  child: const Text(
                    'Send Email',
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
