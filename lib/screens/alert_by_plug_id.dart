import 'package:cafe_plug_guardian_client/style.dart';
import 'package:flutter/material.dart';

class AlertByPlugIdScreen extends StatelessWidget {
  final int plugId;
  const AlertByPlugIdScreen({super.key, required this.plugId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const HeadingText(content: 'Alert')),
      body: Text('플러그 $plugId 개별 알람 스크린 입니다.'),
    );
  }
}
