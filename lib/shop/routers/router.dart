import 'package:flutter/material.dart';
import '../pages/tabs/Tabs.dart';
import '../pages/Search.dart';
import '../pages/GHLoginPage.dart';
import '../pages/GHAddressList.dart';
import '../pages/GHAddressEdit.dart';
import '../pages/GHOnlinePayments.dart';
import '../pages/GHGoodsList.dart';
import '../pages/GHGoodsDetails.dart';
import '../pages/Test.dart';
import '../pages/GHCheckOutPage.dart';
import '../pages/GHOrderList.dart';


//配置路由
final routes = {
  '/': (context,{arguments}) => Tabs(arguments:arguments),
  '/search': (context) => SearchPage(),
  '/login': (context) => GHLoginPage(),
  '/GHAddressList': (context,{arguments}) => GHAddressList(),
  '/GHAddressEdit': (context,{arguments}) => GHAddressEdit(arguments:arguments),
  '/OnlinePayments': (context,{arguments}) => GHOnlinePayments(arguments:arguments),
  '/GHGoodsList': (context,{arguments}) => GHGoodsList(),
  '/GHGoodsDetails': (context,{arguments}) => GHGoodsDetails(arguments:arguments),

   /// 订单确认页
  '/GHCheckOutPage': (context,{arguments}) => GHCheckOutPage(arguments:arguments),
   /// 订单列表
  '/GHOrderListPage': (context) => GHOrderListPage(),
};

/// 固定写法不需要改动
var onGenerateRoute = (RouteSettings settings) {
// 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
