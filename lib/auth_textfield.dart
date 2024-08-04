// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:global_edu/my_colors.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  var obsecureText;
  var suffixIcon;
  var inputType;
  var controller;
  var maxLength;
  AuthTextField(
      {super.key,
      required this.hintText,
      this.obsecureText,
      this.inputType,
      this.controller,
      this.suffixIcon,
      this.maxLength,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: TextFormField(
        maxLength: maxLength,
        keyboardType: inputType,
        obscureText: obsecureText,
        cursorColor: MyColors.black,
        validator: validator,
        controller: controller,
        style: const TextStyle(color: MyColors.black, fontSize: 16),
        decoration: InputDecoration(
            counterText: "",
            fillColor: MyColors.lightColor,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            hintText: hintText,
            hintStyle: const TextStyle(color: MyColors.black),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.black),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            hoverColor: MyColors.black,
            filled: true,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.black),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            )),
      ),
    );
  }
}
