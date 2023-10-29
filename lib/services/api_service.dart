import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://43.202.29.19";

  static Future<String> login(String userId, String password) async {
    final url = Uri.parse('$baseUrl/');
    final response = await http.post(
      url,
      body: {
        'userId': userId,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      final token = response.body;
      return token;
    } else {
      throw Exception('Failed to login');
    }
  }
}
