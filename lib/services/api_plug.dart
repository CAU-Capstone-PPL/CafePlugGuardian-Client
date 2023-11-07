import 'dart:convert';
import 'package:cafe_plug_guardian_client/models/plug_core_model.dart';
import 'package:cafe_plug_guardian_client/models/plug_detail_model.dart';
import 'package:http/http.dart' as http;

class ApiPlug {
  static const String baseUrl = "http://43.202.29.19";

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

  static Future<PlugDetatilModel> getPlugById(String id) async {
    final url = Uri.parse("$baseUrl/$id URL"); //url 수정 필요
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final plug = jsonDecode(response.body);
      return PlugDetatilModel.fromJson(plug);
    }
    throw Error();
  }

  static Future<List<double>> getWeeklyPower() async {
    final url = Uri.parse('$baseUrl/power weekly url'); //url 수정 필요
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<double> weeklyPower = jsonDecode(response.body);
      return weeklyPower;
    }
    throw Error();
  }

  //더미데이터
  static const List<Map<String, dynamic>> dummyDataPlugCore = [
    {
      "plugId": "1",
      "plugName": "Plug 1",
      "onOff": "On",
      "startTime": "08:00 AM",
      "runningTime": "2 h",
      "usedPower": "100W",
      "assignPower": "150W",
    },
    {
      "plugId": "2",
      "plugName": "Plug 2",
      "onOff": "Off",
      "startTime": "",
      "runningTime": "",
      "usedPower": "",
      "assignPower": "",
    },
    {
      "plugId": "3",
      "plugName": "Plug 3",
      "onOff": "On",
      "startTime": "03:45 PM",
      "runningTime": "3 h",
      "usedPower": "120W",
      "assignPower": "200W",
    },
    {
      "plugId": "4",
      "plugName": "Plug 4",
      "onOff": "On",
      "startTime": "09:15 AM",
      "runningTime": "1.5 h",
      "usedPower": "80W",
      "assignPower": "110W"
    },
    {
      "plugId": "5",
      "plugName": "Plug 5",
      "onOff": "Off",
      "startTime": "",
      "runningTime": "",
      "usedPower": "",
      "assignPower": ""
    },
    {
      "plugId": "6",
      "plugName": "Plug 6",
      "onOff": "On",
      "startTime": "04:30 PM",
      "runningTime": "2 h",
      "usedPower": "110W",
      "assignPower": "150W"
    },
    {
      "plugId": "7",
      "plugName": "Plug 7",
      "onOff": "On",
      "startTime": "11:45 AM",
      "runningTime": "2.5 h",
      "usedPower": "95W",
      "assignPower": "130W"
    },
    {
      "plugId": "8",
      "plugName": "Plug 8",
      "onOff": "Off",
      "startTime": "",
      "runningTime": "",
      "usedPower": "",
      "assignPower": ""
    },
    {
      "plugId": "9",
      "plugName": "Plug 9",
      "onOff": "On",
      "startTime": "06:00 AM",
      "runningTime": "4 h",
      "usedPower": "150W",
      "assignPower": "180W"
    },
    {
      "plugId": "10",
      "plugName": "Plug 10",
      "onOff": "Off",
      "startTime": "",
      "runningTime": "",
      "usedPower": "",
      "assignPower": ""
    },
    {
      "plugId": "11",
      "plugName": "Plug 11",
      "onOff": "On",
      "startTime": "07:30 AM",
      "runningTime": "3 h",
      "usedPower": "120W",
      "assignPower": "160W"
    },
    {
      "plugId": "12",
      "plugName": "Plug 12",
      "onOff": "On",
      "startTime": "10:00 AM",
      "runningTime": "1.5 h",
      "usedPower": "70W",
      "assignPower": "100W"
    },
    {
      "plugId": "13",
      "plugName": "Plug 13",
      "onOff": "Off",
      "startTime": "",
      "runningTime": "",
      "usedPower": "",
      "assignPower": ""
    }
  ];

  static Future<List<PlugCoreModel>> testFetchPlugData() async {
    // 실제 API를 호출하는 대신 더미 데이터를 반환합니다.
    List<PlugCoreModel> plugInstances = [];
    const List<dynamic> plugs = dummyDataPlugCore;
    for (var plug in plugs) {
      final instance = PlugCoreModel.fromJson(plug);
      plugInstances.add(instance);
    }
    return plugInstances;
  }

  //더미데이터
  static const List<Map<String, dynamic>> dummyDataPlugDetail = [
    {
      "plugId": "1",
      "plugName": "Plug 1",
      "onOff": "On",
      "startTime": "08:00 AM",
      "runningTime": "2 h",
      "usedPower": "100W",
      "assignPower": "150W",
      "plugDescription": "hello 1",
    },
    {
      "plugId": "2",
      "plugName": "Plug 2",
      "onOff": "Off",
      "startTime": "",
      "runningTime": "",
      "usedPower": "",
      "assignPower": "",
      "plugDescription": "hello 2",
    },
    {
      "plugId": "3",
      "plugName": "Plug 3",
      "onOff": "On",
      "startTime": "03:45 PM",
      "runningTime": "3 h",
      "usedPower": "120W",
      "assignPower": "200W",
      "plugDescription": "hello 3",
    },
    {
      "plugId": "4",
      "plugName": "Plug 4",
      "onOff": "On",
      "startTime": "09:15 AM",
      "runningTime": "1.5 h",
      "usedPower": "80W",
      "assignPower": "110W",
      "plugDescription": "hello 4",
    },
    {
      "plugId": "5",
      "plugName": "Plug 5",
      "onOff": "Off",
      "startTime": "",
      "runningTime": "",
      "usedPower": "",
      "assignPower": "",
      "plugDescription": "hello 5",
    },
    {
      "plugId": "6",
      "plugName": "Plug 6",
      "onOff": "On",
      "startTime": "04:30 PM",
      "runningTime": "2 h",
      "usedPower": "110W",
      "assignPower": "150W",
      "plugDescription": "hello 6",
    },
    {
      "plugId": "7",
      "plugName": "Plug 7",
      "onOff": "On",
      "startTime": "11:45 AM",
      "runningTime": "2.5 h",
      "usedPower": "95W",
      "assignPower": "130W",
      "plugDescription": "hello 7",
    },
    {
      "plugId": "8",
      "plugName": "Plug 8",
      "onOff": "Off",
      "startTime": "",
      "runningTime": "",
      "usedPower": "",
      "assignPower": "",
      "plugDescription": "hello 8",
    },
    {
      "plugId": "9",
      "plugName": "Plug 9",
      "onOff": "On",
      "startTime": "06:00 AM",
      "runningTime": "4 h",
      "usedPower": "150W",
      "assignPower": "180W",
      "plugDescription": "hello 9",
    },
    {
      "plugId": "10",
      "plugName": "Plug 10",
      "onOff": "Off",
      "startTime": "",
      "runningTime": "",
      "usedPower": "",
      "assignPower": "",
      "plugDescription": "hello 10",
    },
    {
      "plugId": "11",
      "plugName": "Plug 11",
      "onOff": "On",
      "startTime": "07:30 AM",
      "runningTime": "3 h",
      "usedPower": "120W",
      "assignPower": "160W",
      "plugDescription": "hello 11",
    },
    {
      "plugId": "12",
      "plugName": "Plug 12",
      "onOff": "On",
      "startTime": "10:00 AM",
      "runningTime": "1.5 h",
      "usedPower": "70W",
      "assignPower": "100W",
      "plugDescription": "hello 12",
    },
    {
      "plugId": "13",
      "plugName": "Plug 13",
      "onOff": "Off",
      "startTime": "",
      "runningTime": "",
      "usedPower": "",
      "assignPower": "",
      "plugDescription": "hello 13",
    }
  ];

  static Future<PlugDetatilModel> testFetchPlugDetailById(String id) async {
    // 실제 API를 호출하는 대신 더미 데이터를 반환합니다.
    Map<String, dynamic> plugDataById =
        dummyDataPlugDetail.firstWhere((e) => e['plugId'] == id);
    final plugInstance = PlugDetatilModel.fromJson(plugDataById);
    return plugInstance;
  }

  static const List<double> dummyDataWeeklyPowerData = [
    70.0,
    60.0,
    120.0,
    150.6,
    200.7,
    70.4,
    80.7
  ];

  static Future<List<double>> testGetWeeklyPower() async {
    List<double> weeklyPowerData = dummyDataWeeklyPowerData;
    return Future.delayed(const Duration(seconds: 0), () => weeklyPowerData);
  }
}
