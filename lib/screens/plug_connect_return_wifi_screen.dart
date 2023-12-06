import 'package:cafe_plug_guardian_client/services/api_plug.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

class PlugConnectWifiScreen extends StatefulWidget {
  String topic;

  PlugConnectWifiScreen({super.key, required this.topic});

  @override
  State<PlugConnectWifiScreen> createState() => _PlugConnectScreenState();
}

class _PlugConnectScreenState extends State<PlugConnectWifiScreen> {
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
            const HeadingText(content: '플러그 핫스팟 연결 후 해제하고, 데이터나 와이파이 연결 후 연결 버튼을 눌러주세요.'),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              content: '연결',
              onPressed: () async {
                //userId, cafeId 받을 방법 구현 전까지 더미 대입
                //await ApiPlug.patchPlugConnect(widget.topic, userId, cafeId);
                await ApiPlug.patchPlugConnect(widget.topic, 1, 1);

                Navigator.pop(context);
              }
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
