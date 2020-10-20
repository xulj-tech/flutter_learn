import 'package:flutter/material.dart';

import 'home_content.dart';
import 'wechat_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

//页面list
List<Widget> pages = [
  HomePage(),
  WeChatPage(),
  HomePage(),
  HomePage(),
  HomePage(),
];

//bottomNavigationBar item list
List<MyBottomBarItem> items = [
  MyBottomBarItem("home", "首页"),
  MyBottomBarItem("wechat", "公众号"),
  MyBottomBarItem("project", "项目"),
  MyBottomBarItem("navigate", "导航"),
  MyBottomBarItem("knowledge", "知识体系"),
];

class MyBottomBarItem extends BottomNavigationBarItem {
  MyBottomBarItem(String iconName, String title)
      : super(
          label: title,
          icon: Image.asset("assets/images/tabbar/$iconName.png",
              width: 25, gaplessPlayback: true),
          activeIcon: Image.asset("assets/images/tabbar/${iconName}_active.png",
              width: 25, gaplessPlayback: true),
        );
}
