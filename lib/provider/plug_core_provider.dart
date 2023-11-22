import 'package:cafe_plug_guardian_client/models/plug_core_model.dart';
import 'package:cafe_plug_guardian_client/services/api_plug.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:flutter/material.dart';

class PlugCoreProvider extends ChangeNotifier {
  List<PlugCoreModel> _plugs = [];
  bool _test = true;

  List<PlugCoreModel> get plugs => _plugs;

  void updatePlugs() async {
    if (_test) {
      _plugs = await ApiTest.testGetOnPlugs();
      print('fetch 완');
      _test = false;
    } else {
      _plugs = await ApiTest.testGetPlugs();
      print('바뀐 api');
      _test = true;
    }
    notifyListeners();
  }
}
