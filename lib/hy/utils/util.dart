import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/api/common_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:steel_crypt/steel_crypt.dart';

class Util {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  static bool isNullOrEmpty(String str) {
    return str == null || str.length <= 0;
  }

  static void showSnackBar(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(
      SnackBar(content: Text("$msg")),
    );
  }

  static showToast(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

  static showMessageDialog(BuildContext ctx, String message) {
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text('提示'),
          content: new Text(message),
          actions: <Widget>[
            new FlatButton(
              child: new Text("确定"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static showLogoutDialog(BuildContext ctx, String message) {
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text('提示'),
          content: new Text(message),
          actions: <Widget>[
            new FlatButton(
              child: new Text("确定"),
              onPressed: () {
                CommonService.logout(onSuccess: (value){
                  Navigator.of(context).pop();
                }, onError: (error){
                  showToast(error);
                }
                );
              },
            ),
          ],
        );
      },
    );
  }

  static String getUUID() {
    String alphabet = '0123456789abcdef';
    int length = 32;
    String result = '';
    for (var i = 0; i < length; i++) {
      result = result + alphabet[Random().nextInt(alphabet.length)];
    }
    return result;
  }

  static Future<List<String>> getImages() async {
    var list = [
      "homepage_bt_contentunion_on.png",
      "homepage_bt_calpolice_on.png",
      "homepage_bt_process_on.png",
      "homepage_bt_entry_on.png",
      "homepage_bt_statistical_on.png",
      "homepage_bt_message_on.png",
      "homepage_bt_knowledge_on.png",
      "homepage_bt_mine_on.png",
      "homepage_bt_set_on.png",
    ];
    return list;
  }

  static List<String> getMenuName() {
    var list = [
      "物联操控",
      "报警管理",
      "流程管理",
      "数据录入",
      "数据查询",
      "移动考勤",
      "知识查询",
      "个人中心",
      "系统配置"
    ];
    return list;
  }

  static Future<String> aesEncrypt(String pwd, String key) async {
    String encryptedString;
    try {
      var aesEncrypt = AesCrypt(key, 'ecb', 'pkcs7');
      encryptedString = aesEncrypt.encrypt(pwd, ''); //encrypt
      print(encryptedString);
      return encryptedString;
    } catch (e) {
      return Future.error(e);
    }
  }
}
