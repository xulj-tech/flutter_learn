import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {

  static const KEY_SERVER_IP="server_ip";
  static const KEY_SERVER_PORT="server_port";
  static const KEY_USERNAME="username";
  static const KEY_PASSWORD="password";
  static const KEY_SRC_ID="SrcID";
  static const KEY_BASE_URL="base_url";


  static put(String key, String value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static getString(String key, Function callback) async {
    SharedPreferences.getInstance().then((prefs) {
      callback(prefs.getString(key));
    });
  }

  static putServerIp(String value) {
    put(KEY_SERVER_IP, value);
  }

  static getServerIp(Function callback) {
    getString(KEY_SERVER_IP,callback);
  }

  static putServerPort(String value) {
    put(KEY_SERVER_PORT, value);
  }

  static getServerPort(Function callback) {
    getString(KEY_SERVER_PORT,callback);
  }

  static putSrcID(String value) {
    put(KEY_SRC_ID, value);
  }

  static getSrcID(Function callback) {
    getString(KEY_SRC_ID,callback);
  }

  static putUserName(String value) {
    put(KEY_USERNAME, value);
  }

  static getUserName(Function callback) {
    getString(KEY_USERNAME,callback);
  }

  static putPassword(String value) {
    put(KEY_PASSWORD, value);
  }

  static getPassword(Function callback) {
    getString(KEY_PASSWORD,callback);
  }

  static putBaseUrl(String value) {
    put(KEY_BASE_URL, value);
  }

  static getBaseUrl(Function callback) {
    getString(KEY_BASE_URL,callback);
  }

}
