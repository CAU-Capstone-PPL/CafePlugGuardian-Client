import 'dart:convert';

import 'package:cafe_plug_guardian_client/models/menu_model.dart';
import 'package:http/http.dart' as http;

class ApiMenu {
  static const String baseUrl = 'http://43.202.29.19/api';

  //get 사장님 상점 메뉴 리스트
  static Future<List<MenuModel>> getMenuList(int plugId) async {
    final url = Uri.parse('$baseUrl/url 미정');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic body = jsonDecode(response.body);
    final List<dynamic> menuList = body['result'];
    final List<MenuModel> menuInstance =
        menuList.map((alert) => MenuModel.fromJson(alert)).toList();

    return menuInstance;
  }

  //post 사장님 상점 메뉴 추가
  static Future<bool> addMenu(int plugId, MenuModel menu) async {
    final url = Uri.parse('$baseUrl/url 미정');
    final body = jsonEncode(menu);

    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body);

    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic json = jsonDecode(response.body);
    return json['success'];
  }

  //patch 사장님 상점 메뉴 수정
  static Future<bool> patchMenu(int plugId, int menuId, MenuModel menu) async {
    final url = Uri.parse('$baseUrl/url 미정');
    final body = jsonEncode(menu);

    final response = await http.patch(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body);

    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic json = jsonDecode(response.body);
    return json['success'];
  }

  //delete 사장님 상점 메뉴 삭제
  static Future<bool> deleteMenu(int plugId, int menuId) async {
    final url = Uri.parse('$baseUrl/url 미정');

    final response = await http.delete(url);

    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic json = jsonDecode(response.body);
    return json['success'];
  }
}
