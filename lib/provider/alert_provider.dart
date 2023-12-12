import 'package:cafe_plug_guardian_client/models/alert_model.dart';
import 'package:cafe_plug_guardian_client/services/api_alert.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:flutter/material.dart';

class AlertProvider extends ChangeNotifier {
  List<AlertModel> _allAlertList = [];
  List<AlertModel> _alertListById = [];

  List<AlertModel> get allAlertList => _allAlertList;
  List<AlertModel> get alertListById => _alertListById;

  void updateAllAlert(int cafeId) async {
    //_allAlertList = await ApiTest.testGetAlertList();
    _allAlertList = await ApiAlert.getAlertList(cafeId);
    notifyListeners();
  }

  void updateAlertsById(int plugId) async {
    //_alertListById = await ApiTest.testGetAlertListByPlugId(plugId);
    _alertListById = await ApiAlert.getAlertListById(plugId);
    notifyListeners();
  }

  void check(int cafeId, int plugId, int plugOffLogId) async {
    if (await ApiAlert.patchOwnerCheck(plugOffLogId)) {
      updateAllAlert(cafeId);
      updateAlertsById(plugId);
    } else {
      print('check 실패');
    }
  }
}
