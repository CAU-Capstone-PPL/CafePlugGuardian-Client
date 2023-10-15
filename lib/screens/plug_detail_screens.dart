import 'package:flutter/material.dart';

class PlugDetailScreen extends StatelessWidget {
  const PlugDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: const Text("여기는 플러그 디테일 페이지 입니다."),
      ),
    );
  }
}
