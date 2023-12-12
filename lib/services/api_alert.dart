import 'dart:convert';
import 'package:cafe_plug_guardian_client/models/alert_model.dart';
import 'package:http/http.dart' as http;

class ApiAlert {
  static const String baseUrl = 'http://43.202.29.19/api';

  //알림 리스트 ⇒ 알림 스크린에 띄울것 (get)
  static Future<List<AlertModel>> getAlertList(int cafeId) async {
    final url = Uri.parse('$baseUrl/cafe/$cafeId/blockingLog');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic body = jsonDecode(response.body);
    final List<dynamic> alerts = body['result'];
    final List<AlertModel> alertInstance =
        alerts.map((alert) => AlertModel.fromJson(alert)).toList();

    return alertInstance;
  }

  //플러그별 비허용 로그 리스트 ⇒ 플러그별 비허용 로그 스크린에 띄울것 (get)
  static Future<List<AlertModel>> getAlertListById(int plugId) async {
    final url = Uri.parse('$baseUrl/plug/$plugId/blockingLog');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic body = jsonDecode(response.body);
    final List<dynamic> alerts = body['result'];
    final List<AlertModel> alertInstance =
        alerts.map((alert) => AlertModel.fromJson(alert)).toList();

    return alertInstance;
  }

  //관리자용 앱 플러그 차단 로그 확인 완료
  static Future<bool> patchOwnerCheck(int plugOffLogId) async {
    final url = Uri.parse('$baseUrl/log/check');
    final data = {'plugOffLogId': plugOffLogId};

    final response = await http.patch(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data));

    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic json = jsonDecode(response.body);
    return json['success'];
  }
}
