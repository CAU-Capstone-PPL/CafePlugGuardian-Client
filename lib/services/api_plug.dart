import 'dart:convert';
import 'package:cafe_plug_guardian_client/models/alert_model.dart';
import 'package:cafe_plug_guardian_client/models/plug_core_model.dart';
import 'package:cafe_plug_guardian_client/models/plug_detail_model.dart';
import 'package:http/http.dart' as http;

class ApiPlug {
  static const String baseUrl = 'http://43.202.29.19';

  //플러그 정보 리스트 (get) ⇒ 홈스크린과 플러그 전체 스크린에 띄울 것
  static Future<List<PlugCoreModel>> getOnPlugs() async {
    final url = Uri.parse('$baseUrl/plug url'); //url 수정 필요
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Error();
    }
    final List<dynamic> plugs = jsonDecode(response.body);
    List<PlugCoreModel> plugInstances =
        plugs.map((plug) => PlugCoreModel.fromJson(plug)).toList();
    return plugInstances;
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

  //플러그 개별 제어 on/off → 홈스크린에서 개별 플러그 On/off 제어 (post)

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

  //플러그 추가

  //플러그 삭제

  //플러그 이름 수정

  //플러그 설명 수정
}
