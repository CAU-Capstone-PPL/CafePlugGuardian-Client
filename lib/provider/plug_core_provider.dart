import 'package:cafe_plug_guardian_client/models/plug_core_model.dart';
import 'package:cafe_plug_guardian_client/services/api_plug.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:flutter/material.dart';

class PlugCoreProvider extends ChangeNotifier {
  List<PlugCoreModel> _onPlugs = [];
  List<PlugCoreModel> _allPlugs = [];
  final bool _test = true;

  List<PlugCoreModel> get onPlugs => _onPlugs;
  List<PlugCoreModel> get allPlugs => _allPlugs;

  void updateOnPlugs() async {
    _onPlugs = await ApiPlug.getOnPlugs(1);
    /*if (_test) {
      //_onPlugs = await ApiTest.testGetOnPlugs();
      
      print('updateOnPlugs');
      _test = false;
    } else {
      _onPlugs = await ApiTest.testGetOnPlugsChanged();
      print('updateOnPlugs');
      _test = true;
    }*/
    notifyListeners();
  }

  void updateAllPlugs() async {
    _allPlugs = await ApiPlug.getPlugs(1);
    /*if (_test) {
      _allPlugs = await ApiTest.testGetPlugs();
      print('updateAllPlugs');
      _test = false;
    } else {
      _allPlugs = await ApiTest.testGetPlugsChanged();
      print('updateAllPlugs');
      _test = true;
    }*/
    notifyListeners();
  }
}
