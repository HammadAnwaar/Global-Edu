import 'package:flutter/material.dart';
import 'package:global_edu/my_colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  const MyButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 200,
      decoration: BoxDecoration(
          color: MyColors.appColor,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: MyColors.black)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              color: MyColors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
