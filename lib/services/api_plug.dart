import 'dart:convert';
import 'package:cafe_plug_guardian_client/models/alert_model.dart';
import 'package:cafe_plug_guardian_client/models/plug_core_model.dart';
import 'package:cafe_plug_guardian_client/models/plug_detail_model.dart';
import 'package:http/http.dart' as http;

class ApiPlug {
  static const String baseUrl = 'http://43.202.29.19/api';
  static const String plugBaseUrl = 'http://192.168.4.1';

  //플러그 정보 리스트 (get) ⇒ 홈스크린과 플러그 전체 스크린에 띄울 것
  static Future<List<PlugCoreModel>> getOnPlugs(int cafeId) async {
    final url = Uri.parse('$baseUrl/cafe/$cafeId/plug');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Error();
    }
    final Map<String, dynamic> body = jsonDecode(response.body);
    final List<dynamic> plugs = body['result'];
    List<PlugCoreModel> plugInstances = plugs.map((plug) {
      return PlugCoreModel.fromJson(plug);
    }).toList();

    return plugInstances
        .toList(); //.where((plug) => plug.useStatus == true).toList();
  }

  //플러그 디테일 정보 (get) ⇒ 플러그 상세 스크린에 띄울 것 id를 이용
  static Future<PlugDetatilModel> getPlugById(String id) async {
    final url = Uri.parse('$baseUrl/$id URL'); //url 수정 필요
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Error();
    }
    return PlugDetatilModel.fromJson(jsonDecode(response.body));
  }

  //알림 리스트 ⇒ 알림 스크린에 띄울것 (get)
  static Future<List<AlertModel>> getAlertList() async {
    List<AlertModel> alertInstance = [];
    final url = Uri.parse('$baseUrl/alerts url'); //url 수정 필요
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Error();
    }
    final List<dynamic> alerts = jsonDecode(response.body);
    alertInstance = alerts.map((alert) => AlertModel.fromJson(alert)).toList();
    return alertInstance;
  }

  //플러그 총 갯수와 플러그 리스트 → 플러그 리스트 스크린에 띄울 것 (get) : static Future<List<PlugCoreModel>> getPlugs() async
  //알림 리스트 ⇒ 알림 스크린에 띄울것 (get)
  static Future<List<PlugCoreModel>> getPlugs() async {
    List<PlugCoreModel> plugsInstance = [];
    final url = Uri.parse('$baseUrl/user/1/cafe/1/plug'); //url 수정 필요
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Error();
    }
    final Map<String, dynamic> responseBody = jsonDecode(response.body);
    final List<dynamic> plugs = responseBody['result'];
    plugsInstance = plugs.map((plug) => PlugCoreModel.fromJson(plug)).toList();
    return plugsInstance;
  }

  //플러그 개별 제어 on/off → 홈스크린에서 개별 플러그 On/off 제어 (patch)
  static Future<bool> patchPlugOn(int plugId) async {
    final url = Uri.parse('$baseUrl/plug/$plugId/turnOn');
    final response = await http.patch(url);

    if (response.statusCode != 200) {
      return false;
    }
    return true;
  }

  //플러그 개별 제어 on/off → 홈스크린에서 개별 플러그 On/off 제어 (post)
  static Future<bool> patchPlugOff(int plugId) async {
    final url = Uri.parse('$baseUrl/plug/$plugId/turnOff');
    final response = await http.patch(url);

    if (response.statusCode != 200) {
      return false;
    }
    return true;
  }

  //최근 일주일 간 총 플러그 전력 사용량 (get)
  static Future<List<double>> getWeeklyPower() async {
    final url = Uri.parse('$baseUrl/power weekly url'); //url 수정 필요
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<double> weeklyPower = jsonDecode(response.body);
      return weeklyPower;
    }
    throw Error();
  }

  //최근 일주일 간 개별 플러그 전력 사용량 (get) ⇒ 플러그 상세 스크린에 해당 플러그 전력 사용 그래프 띄울 것

  //플러그 연결
  static Future<void> patchPlugConnect(
      String topic, int userId, int cafeId) async {
    final url = Uri.parse('$baseUrl/plug?topic=$topic');

    Map<String, dynamic> data = {
      'userId': userId,
      'cafeId': cafeId,
    };

    final body = json.encode(data);

    final response = await http.patch(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body);

    return; //리턴하는게 있는데 필요 없을 수도?
  }

  //플러그 삭제

  //플러그 이름 수정

  //플러그 설명 수정

  //플러그 토픽 요청
  static Future<String> getPlugTopic() async {
    final url = Uri.parse('$plugBaseUrl/cm?cmnd=status%200');
    final response = await http.get(url);

    final Map<String, dynamic> status = jsonDecode(response.body);
    return status['Status']['Topic'] as String;
  }

  //플러그 와이파이 연결
  static Future<void> getPlugConnectWiFi(String ssid, String password) async {
    final url = Uri.parse(
        '$plugBaseUrl/cm?cmnd=backlog%20ssid1%20$ssid%3Bpassword1%20$password');
    final response = await http.get(url);

    return;
  }
}
