import 'dart:convert';
import 'package:cafe_plug_guardian_client/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiLogin {
  static const String baseUrl = 'http://43.202.29.19/api';

  //로그인
  static Future<UserModel> postLogin(String userAccount, String userPw) async {
    final url = Uri.parse('$baseUrl/user/login');
    Map<String, dynamic> data = {
      'userAccount': userAccount,
      'userPw': userPw,
    };
    final body = jsonEncode(data);
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body);
    print(response.statusCode);
    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic json = jsonDecode(response.body);
    UserModel result = UserModel.fromJson(json['result']);

    return result;
  }

  //회원가입
  static Future<bool> singUp(
      String userAccount, String userName, String userPw) async {
    final url = Uri.parse('$baseUrl/user/signUp');
    Map<String, dynamic> data = {
      'userAccount': userAccount,
      'userName': userName,
      'userPw': userPw,
    };
    final body = jsonEncode(data);
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body);
    print(response.statusCode);
    if (response.statusCode != 200) {
      final dynamic json = jsonDecode(response.body);
      final String errorMessage = json['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
    final dynamic json = jsonDecode(response.body);

    return json['success'];
  }
}
