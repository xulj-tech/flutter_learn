import 'package:flutter/material.dart';

class UserInfo {
  String name;

  int age;

  UserInfo(this.name, this.age);
}

/// with ChangeNotifier
class MyCounter with ChangeNotifier {
  UserInfo _userInfo = UserInfo("leo", 10);

  UserInfo get userInfo => _userInfo;

  void add() {
    _userInfo.age++;
    notifyListeners();
  }
}

///  extends ChangeNotifier
class MySubtract extends ChangeNotifier {
  UserInfo _userInfo = UserInfo("jim", 100);

  UserInfo get userInfo => _userInfo;

  void sub() {
    _userInfo.age--;
    notifyListeners();
  }
}
