import 'package:flutter_learn/hy/pages/alarm_page.dart';
import 'package:flutter_learn/hy/pages/common_web_page.dart';
import 'package:flutter_learn/hy/pages/deal_alarm_page.dart';
import 'package:flutter_learn/hy/pages/error_alarm_page.dart';
import 'package:flutter_learn/hy/pages/event_detail_page.dart';
import 'package:flutter_learn/hy/pages/home_page.dart';
import 'package:flutter_learn/hy/pages/iot_page.dart';
import 'package:flutter_learn/hy/pages/knowledge_page.dart';
import 'package:flutter_learn/hy/pages/login_page.dart';
import 'package:flutter_learn/hy/pages/person_page.dart';
import 'package:flutter_learn/hy/pages/server_set_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/pages/setting_page.dart';
import 'package:flutter_learn/hy/pages/webview_page.dart';


class RouterConfig {
  static final Map<String, WidgetBuilder> routes = {
    HomePage.routeName: (ctx) => HomePage(),
    LoginPage.routeName: (ctx) => LoginPage(),
    ServerSet.routeName: (ctx) => ServerSet(),
    WebViewPage.routeName: (ctx) => WebViewPage(),
    IotControlPage.routeName: (ctx) => IotControlPage(),
    AlarmPage.routeName:(ctx) => AlarmPage(),
    EventDetailPage.routeName:(ctx) => EventDetailPage(),
    SettingPage.routeName:(ctx) => SettingPage(),
    DealAlarmPage.routeName:(ctx) => DealAlarmPage(),
    EventDetailPage.routeName:(ctx) => EventDetailPage(),
    ErrorAlarmPage.routeName:(ctx) => ErrorAlarmPage(),
    PersonPage.routeName:(ctx) => PersonPage(),
    KnowledgePage.routeName:(ctx) => KnowledgePage(),
  };

  static openWeb(BuildContext context,String title,String code) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return CommonWebViewPage(title,code);
    }));
  }
}