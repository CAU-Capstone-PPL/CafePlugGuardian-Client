import 'package:cafe_plug_guardian_client/models/menu_model.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  List<MenuModel> _menuList = [];

  final bool _test = true;

  List<MenuModel> get menuList => _menuList;

  void updateMenu() async {
    _menuList = await ApiTest.testGetMenu();
    notifyListeners();
  }
}
