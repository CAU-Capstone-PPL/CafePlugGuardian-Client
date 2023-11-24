import 'dart:convert';
import 'package:cafe_plug_guardian_client/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiLogin {
  static const String baseUrl = 'http://43.202.29.19/api';

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
      throw Error();
    }
    final dynamic json = jsonDecode(response.body);
    UserModel result = UserModel.fromJson(json['result']);

    return result;
  }
}
