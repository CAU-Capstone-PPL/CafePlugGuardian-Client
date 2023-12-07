import 'package:cafe_plug_guardian_client/models/cafe_model.dart';
import 'package:cafe_plug_guardian_client/services/api_login.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:flutter/material.dart';

class CafeListProvider extends ChangeNotifier {
  List<CafeModel> _cafeList = [];

  List<CafeModel> get cafeList => _cafeList;

  void updateCafeList(int userId) async {
    _cafeList = await ApiLogin.getCafeList(userId);
    notifyListeners();
  }

  void addCafe(int userId, String cafeName) async {
    if (await ApiLogin.addCafe(userId, cafeName)) {
      updateCafeList(userId);
    }
    notifyListeners();
  }
}
