import 'package:cafe_plug_guardian_client/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String content;
  final void Function() onPressed;
  const CustomButton({
    super.key,
    required this.content,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.main,
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 5.0,
          minimumSize: const Size(100, 30),
        ),
        child: Text(
          content,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ));
  }
}
