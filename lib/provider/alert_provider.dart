import 'package:cafe_plug_guardian_client/models/alert_model.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:flutter/material.dart';

class AlertProvider extends ChangeNotifier {
  List<AlertModel> _allAlertList = [];
  List<AlertModel> _alertListById = [];

  List<AlertModel> get allAlertList => _allAlertList;
  List<AlertModel> get alertListById => _alertListById;

  void updateAllAlert() async {
    _allAlertList = await ApiTest.testGetAlertList();
    notifyListeners();
  }

  void updateAlertsById(int plugId) async {
    _alertListById = await ApiTest.testGetAlertListByPlugId(plugId);
    notifyListeners();
  }

  void check(int plugId) {
    //토글 on으로 바꾸는 api
    updateAllAlert();
    updateAlertsById(plugId);
  }
}
