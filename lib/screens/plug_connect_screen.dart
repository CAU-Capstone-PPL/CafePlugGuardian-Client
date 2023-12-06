import 'package:cafe_plug_guardian_client/screens/plug_connect_return_wifi_screen.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';

class PlugConnectScreen extends StatefulWidget {
  const PlugConnectScreen({super.key});

  @override
  State<PlugConnectScreen> createState() => _PlugConnectScreenState();
}

class _PlugConnectScreenState extends State<PlugConnectScreen> {
  final TextEditingController _ssidController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<bool> _tryConnectWifi(String ssid, String password) async {
    //와이파이 연결은 네이티브 코드 필요해서 임시로 주석 처리 추후 구현

    return true;
  }

  Future<bool> _validateWifiConnection(String ssid, String password) async {
    final info = NetworkInfo();
    String originalSSID = "";
    /*
    String? originalSSID = await info.getWifiName();

    if (originalSSID == null) {
      return false;
    }*/
    bool isConnected = await _tryConnectWifi(ssid, password);
    await _tryConnectWifi(originalSSID, "");

    return isConnected;
  }

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
            const HeadingText(
                content: '플러그 핫스팟에 연결 후 연결할 와이파이 SSID, 비밀번호를 입력해주세요.'),
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
              onPressed: () async {
                String ssid = _ssidController.text;
                String password = _passwordController.text;

                if (await _validateWifiConnection(ssid, password)) {
                  //String topic = await ApiPlug.getPlugTopic();
                  //print('테스트: $topic');
                  //await ApiPlug.getPlugConnectWiFi(ssid, password);
                  String topic = 'hello';

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PlugConnectWifiScreen(topic: topic),
                      ));
                }
              },
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
