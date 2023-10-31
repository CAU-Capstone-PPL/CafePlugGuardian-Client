import 'dart:convert';
import 'package:cafe_plug_guardian_client/models/plug_core_model.dart';
import 'package:http/http.dart' as http;

class ApiPlug {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";

  static Future<List<PlugCoreModel>> getPlugs() async {
    List<PlugCoreModel> plugInstances = [];
    final url = Uri.parse('$baseUrl/plug url'); //url 수정 필요
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> plugs = jsonDecode(response.body);
      for (var plug in plugs) {
        final instance = PlugCoreModel.fromJson(plug);
        plugInstances.add(instance);
      }
      return plugInstances;
    }
    throw Error();
  }
}
