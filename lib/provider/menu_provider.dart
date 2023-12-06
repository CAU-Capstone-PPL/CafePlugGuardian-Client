import 'package:cafe_plug_guardian_client/models/menu_model.dart';
import 'package:cafe_plug_guardian_client/services/api_menu.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  List<MenuModel> _menuList = [];

  final bool _test = true;

  List<MenuModel> get menuList => _menuList;

  void updateMenu(int cafeId) async {
    _menuList = await ApiMenu.getMenuList(cafeId);
    //_menuList = await ApiTest.testGetMenu();
    notifyListeners();
  }

  void addMenu(int cafeId, String name, int price, String description) async {
    if (await ApiMenu.addMenu(cafeId, name, price, description)) {
      updateMenu(cafeId);
    } else {
      print('추가 실패');
    }
    notifyListeners();
  }

  void editMenu(int cafeId, String name, int price, String description) async {
    if (await ApiMenu.patchMenu(cafeId, name, price, description)) {
      updateMenu(cafeId);
    } else {
      print('수정 실패');
    }
    notifyListeners();
  }

  void deleteMenu(int cafeId, int menuId) async {
    if (await ApiMenu.deleteMenu(menuId)) {
      updateMenu(cafeId);
    } else {
      print('삭제 실패');
    }
    notifyListeners();
  }
}
