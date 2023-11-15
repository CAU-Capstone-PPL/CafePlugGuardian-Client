import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

class PlugConnectScreen extends StatefulWidget {
  const PlugConnectScreen({super.key});

  @override
  State<PlugConnectScreen> createState() => _PlugConnectScreenState();
}

class _PlugConnectScreenState extends State<PlugConnectScreen> {
  final TextEditingController _ssidController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: const AppBarText(content: '플러그 추가'),
        backgroundColor: AppColor.background,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/wifi.png'),
              width: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            const HeadingText(content: '플러그를 연결하려면 어쩌구 저쩌구'),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _ssidController,
              decoration: const InputDecoration(
                labelText: 'SSID',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12.0),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12.0),
              ),
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              content: '연결',
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
