import 'package:cafe_plug_guardian_client/models/plug_detail_model.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:flutter/material.dart';

class PlugDetailProvider extends ChangeNotifier {
  PlugDetatilModel _plug =
      PlugDetatilModel(plugId: 0, plugName: '', onOff: '', plugDescription: '');
  bool _test = true;

  PlugDetatilModel? get plug => _plug;

  void updatePlug(int id) async {
    if (_test) {
      _plug = await ApiTest.testGetPlugById(id);
      print('updatePlug');
      _test = false;
    } else {
      _plug = await ApiTest.testGetPlugById(id);
      print('updatePlug');
      _test = true;
    }
    notifyListeners();
  }
}
