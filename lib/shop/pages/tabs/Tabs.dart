import 'package:flutter/material.dart';
import 'GHUserPage.dart';
import '../../services/ScreenAdaper.dart';
import '../../services/gh_sqflite.dart';
import 'GHHomePage.dart';
import 'GHCategoryPage.dart';
import 'GHShopCartPage.dart';

/// tab
class Tabs extends StatefulWidget {
  Map arguments;

  Tabs({Key key, this.arguments}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    if (widget.arguments != null) {
      this._currentIndex = widget.arguments["index"];
    } else {
      this._currentIndex = 0;
    }
    this._pageController = new PageController(initialPage: this._currentIndex);

    GHSqflite sq = GHSqflite();
    sq.create();
  }

  List<Widget> _pageList = [
    GHHomePage(),
    GHCategoryPage(),
    GHShopCartPage(),
    GHUserPage()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenAdaper.init(context);
    return Scaffold(
      body: PageView(
        controller: this._pageController,
        children: this._pageList,
        physics: NeverScrollableScrollPhysics(), // 禁止滑动
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (index) {
          setState(() {
            this._currentIndex = index;
            this._pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              "首页",
              style: TextStyle(fontSize: 12),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text(
              "分类",
              style: TextStyle(fontSize: 12),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text(
              "购物车",
              style: TextStyle(fontSize: 12),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(
              "我的",
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
