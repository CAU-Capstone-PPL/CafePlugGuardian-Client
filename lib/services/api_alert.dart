import 'dart:convert';
import 'package:cafe_plug_guardian_client/models/alert_model.dart';
import 'package:cafe_plug_guardian_client/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiAlert {
  static const String baseUrl = 'http://43.202.29.19/api';

  //알림 리스트 ⇒ 알림 스크린에 띄울것 (get)
  static Future<List<AlertModel>> getAlertList(int cafeId) async {
    final url = Uri.parse('$baseUrl/cafe/$cafeId/blockingLog');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      print(response.statusCode);
      throw Error();
    }
    final dynamic body = jsonDecode(response.body);
    final List<AlertModel> alertInstance =
        body['result'].map((alert) => AlertModel.fromJson(alert)).toList();

    return alertInstance;
  }
}
