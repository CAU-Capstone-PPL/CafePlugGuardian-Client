import 'dart:convert';
import 'package:cafe_plug_guardian_client/models/alert_model.dart';
import 'package:cafe_plug_guardian_client/models/plug_core_model.dart';
import 'package:cafe_plug_guardian_client/models/plug_detail_model.dart';
import 'package:http/http.dart' as http;

class ApiPlug {
  static const String baseUrl = 'http://43.202.29.19/api';
  static const String plugBaseUrl = 'http://192.168.4.1';

  //손님이 사용 중인 카페 플러그 목록
  static Future<List<PlugCoreModel>> getOnPlugs(int cafeId) async {
    final url = Uri.parse('$baseUrl/cafe/$cafeId/plug');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final Map<String, dynamic> body = jsonDecode(response.body);
    final List<dynamic> plugs = body['result'];
    List<PlugCoreModel> plugInstances = plugs.map((plug) {
      return PlugCoreModel.fromJson(plug);
    }).toList();

    return plugInstances.where((plug) => plug.useStatus == true).toList();
  }

  //카페 플러그 목록
  static Future<List<PlugCoreModel>> getPlugs(int cafeId) async {
    final url = Uri.parse('$baseUrl/cafe/$cafeId/plug');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final Map<String, dynamic> body = jsonDecode(response.body);
    final List<dynamic> plugs = body['result'];
    List<PlugCoreModel> plugInstances = plugs.map((plug) {
      return PlugCoreModel.fromJson(plug);
    }).toList();

    return plugInstances;
  }

  //플러그 디테일 정보 (get) ⇒ 플러그 상세 스크린에 띄울 것 id를 이용
  static Future<PlugDetatilModel> getPlugById(int plugId) async {
    final url = Uri.parse('$baseUrl/plug/$plugId/info');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final Map<String, dynamic> body = jsonDecode(response.body);
    print(body['result']);

    return PlugDetatilModel.fromJson(body['result']);
  }

  //토글 on
  static Future<String> patchPlugOn(int plugId) async {
    final url = Uri.parse('$baseUrl/plug/$plugId/turnOn');
    final response = await http.patch(url);

    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic json = jsonDecode(response.body);
    final dynamic result = json['result'];
    return result['toggle'];
  }

  //토클 off
  static Future<String> patchPlugOff(int plugId) async {
    final url = Uri.parse('$baseUrl/plug/$plugId/turnOff');
    final response = await http.patch(url);

    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic json = jsonDecode(response.body);
    final dynamic result = json['result'];
    return result['toggle'];
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
