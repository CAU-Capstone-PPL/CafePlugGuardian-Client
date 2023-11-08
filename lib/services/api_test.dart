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
    return plugInstances;
  }

  static Future<PlugDetatilModel> testGetPlugById(String id) async {
    Map<String, dynamic> plugDataById =
        dummyDataPlugDetail.firstWhere((e) => e['plugId'] == id);
    return PlugDetatilModel.fromJson(plugDataById);
  }

  static Future<List<double>> testGetWeeklyPower() async {
    List<double> weeklyPowerData = dummyDataWeeklyPowerData;
    return Future.delayed(const Duration(seconds: 0), () => weeklyPowerData);
  }

  static Future<List<AlertModel>> tsetGetAlertList() async {
    List<AlertModel> alertInstance = [];
    const List<dynamic> alerts = dummyDataAlerts;
    for (var alert in alerts) {
      final instance = AlertModel.fromJson(alert);
      alertInstance.add(instance);
    }
    return alertInstance;
  }
}
