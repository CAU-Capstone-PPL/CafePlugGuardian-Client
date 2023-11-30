import 'package:cafe_plug_guardian_client/models/alert_model.dart';
import 'package:cafe_plug_guardian_client/models/plug_core_model.dart';
import 'package:cafe_plug_guardian_client/models/plug_detail_model.dart';
import 'package:cafe_plug_guardian_client/services/data_test.dart';

class ApiTest {
  static Future<List<PlugCoreModel>> testGetOnPlugs() async {
    // 실제 API를 호출하는 대신 더미 데이터를 반환합니다.
    List<PlugCoreModel> plugInstances = [];
    const List<dynamic> plugs = dummyDataPlugCore;
    plugInstances = plugs.map((plug) => PlugCoreModel.fromJson(plug)).toList();
    List<PlugCoreModel> onPlugs =
        plugInstances.where((plug) => plug.toggle == true).toList();
    return onPlugs;
  }

  static Future<List<PlugCoreModel>> testGetOnPlugsChanged() async {
    // 실제 API를 호출하는 대신 더미 데이터를 반환합니다.
    List<PlugCoreModel> plugInstances = [];
    const List<dynamic> plugs = dummyDataChanged;
    plugInstances = plugs.map((plug) => PlugCoreModel.fromJson(plug)).toList();
    List<PlugCoreModel> onPlugs =
        plugInstances.where((plug) => plug.toggle == true).toList();
    return onPlugs;
  }

  static Future<PlugDetatilModel> testGetPlugById(int id) async {
    Map<String, dynamic> plugDataById =
        dummyDataPlugDetail.firstWhere((e) => e['plugId'] == id);
    return PlugDetatilModel.fromJson(plugDataById);
  }

  static Future<PlugDetatilModel> testGetPlugChangedById(int id) async {
    Map<String, dynamic> plugDataById =
        dummyDataChanged.firstWhere((e) => e['plugId'] == id);
    return PlugDetatilModel.fromJson(plugDataById);
  }

  static Future<List<PlugCoreModel>> testGetPlugs() async {
    List<PlugCoreModel> plugInstances = [];
    const List<dynamic> plugs = dummyDataPlugCore;
    plugInstances = plugs.map((plug) => PlugCoreModel.fromJson(plug)).toList();
    return plugInstances;
  }

  static Future<List<PlugCoreModel>> testGetPlugsChanged() async {
    List<PlugCoreModel> plugInstances = [];
    const List<dynamic> plugs = dummyDataChanged;
    plugInstances = plugs.map((plug) => PlugCoreModel.fromJson(plug)).toList();
    return plugInstances;
  }

  static Future<List<AlertModel>> testGetAlertList() async {
    List<AlertModel> alertInstance = [];
    const List<dynamic> alerts = dummyDataAlerts;
    alertInstance = alerts.map((alert) => AlertModel.fromJson(alert)).toList();
    return alertInstance;
  }

  static Future<List<AlertModel>> testGetAlertListByPlugId(int plugId) async {
    List<AlertModel> alertInstance = await testGetAlertList();
    List<AlertModel> alertsByPlugId =
        alertInstance.where((alert) => alert.plugId == plugId).toList();
    return alertsByPlugId;
  }

  static Future<List<double>> testGetWeeklyPower() async {
    List<double> weeklyPowerData = dummyDataWeeklyPowerData;
    return Future.delayed(const Duration(seconds: 0), () => weeklyPowerData);
  }
}
