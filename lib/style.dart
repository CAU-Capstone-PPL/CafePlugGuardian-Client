import 'package:flutter/material.dart';

class AppColor extends Color {
  AppColor(super.value);

  static const background = Color(0xFFF4F4F5);
  static const main = Color(0xFF58E2C9);
  static const text = Color(0xFF282828);
}

class CaptionText extends StatelessWidget {
  final String content;
  const CaptionText({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(fontSize: 12, color: AppColor.text),
    );
  }
}

class BoldText extends StatelessWidget {
  final String content;
  final Color color = AppColor.text;
  const BoldText({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.text),
    );
  }
}

class NormalText extends StatelessWidget {
  final String content;
  const NormalText({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(fontSize: 16, color: AppColor.text),
    );
  }
}

class TitleText extends StatelessWidget {
  final String content;
  const TitleText({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.text),
    );
  }
}

class HeadingText extends StatelessWidget {
  final String content;
  const HeadingText({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.text),
    );
  }
}

class AppBarText extends StatelessWidget {
  final String content;
  const AppBarText({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: AppColor.text),
    );
  }
}
