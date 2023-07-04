import 'package:fakenews2/api/model/response/User.dart';
import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String? token;

  User? user;

  void updateUser(User? user) {
    this.user = user;
  }

  void updateToken(String? token) {
    this.token = token;
  }
}
