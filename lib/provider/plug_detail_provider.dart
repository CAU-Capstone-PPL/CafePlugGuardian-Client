import 'package:cafe_plug_guardian_client/models/plug_detail_model.dart';
import 'package:cafe_plug_guardian_client/models/time_model.dart';
import 'package:cafe_plug_guardian_client/services/api_plug.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:flutter/material.dart';

class PlugDetailProvider extends ChangeNotifier {
  PlugDetatilModel _plug = PlugDetatilModel(
    plugId: 0,
    plugName: '',
    toggle: false,
    useStatus: false,
    plugDescription: '로딩 중...',
    startTime: TimeModel(hours: 0, minutes: 0),
    runningTime: TimeModel(hours: 0, minutes: 0),
    assignPower: 0.0,
    usedPower: 0.0,
    realTimePower: 0.0,
  );
  bool _test = true;

  PlugDetatilModel? get plug => _plug;

  void updatePlug(int id) async {
    //_plug = await ApiPlug.getPlugById(id);
    if (_test) {
      _plug = await ApiTest.testGetPlugById(id);
      print('updatePlug');
      _test = false;
    } else {
      _plug = await ApiTest.testGetPlugChangedById(id);
      print('updatePlug');
      _test = true;
    }
    notifyListeners();
  }
}
