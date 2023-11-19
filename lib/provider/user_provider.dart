import 'package:cafe_plug_guardian_client/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  bool get isAuthenticated => _user != null;

  void login(int userId, String userName, String token) {
    _user = UserModel(userId: userId, userName: userName, token: token);
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
