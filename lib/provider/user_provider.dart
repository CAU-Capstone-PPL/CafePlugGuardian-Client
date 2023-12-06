import 'package:cafe_plug_guardian_client/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  int? _cafeId;
  String? _cafeName;

  UserModel? get user => _user;
  int? get cafeId => _cafeId;
  String? get cafeName => _cafeName;
  bool get isAuthenticated => _user != null;

  void login(UserModel user) {
    _user = user;
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }

  void selectCafe(int cafeId, String cafeName) {
    _cafeId = cafeId;
    _cafeName = cafeName;
    notifyListeners();
  }
}
