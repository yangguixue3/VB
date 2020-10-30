import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storedemo/pages/cartPage.dart';
import 'package:storedemo/pages/categoryPage.dart';
import 'package:storedemo/pages/home.dart';
import 'package:storedemo/pages/memberPage.dart';

// material风格： Material Design 是由Google推出的全新设计语言，这种设计语言是为手机、平板电脑、台式机和其他平台提供一致，
// cupertino风格：即IOS风格组件，它重现了很多经典的有IOS特性的交互和界面风格

//  BottomNavigationBar部件的使用，最终作成底部切换效果。
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // tabBodies的List索引 相当于改变了页面
  int currentIndex = 0;
  // 前选择的页面，并进行呈现出来
  var currentPage;

  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  // 建立分页数组
  final List tabBodies = [HomePage(), CategoryPage(), CartPage(), MemberPage()];
  // 底部导航list 设定
  final List<BottomNavigationBarItem> boottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('会员中心'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        // 设置底部tab的样式
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: boottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
