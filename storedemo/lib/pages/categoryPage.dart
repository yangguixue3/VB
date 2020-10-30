// 商城分类UI页面
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:storedemo/config/serviceUrlGetMethod.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ExpansionPanelPage(),
    ));
  }
}

// 二级菜单类
class User {
  String name;
  String title;
  User({this.name, this.title});
  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
  }
}

// 一级菜单类
class Userk extends User {
  Userk({this.name, this.title, this.children});
  String name;
  String title;
  List<User> children;
  //调用fromJson将二级菜单数据，转换为User类
  factory Userk.fromJson(Map<String, dynamic> json) {
    final String name = json['name'];
    final String title = json['title'];
    //先将children转化成List，再将List中的值转换成User
    List<User> children =
        (json['children'] as List).map((i) => User.fromJson(i)).toList();
    return Userk(name: name, title: title, children: children);
  }
}

// 整合数据类，用于
class Item {
  Item({
    this.userk,
    this.isExpanded,
  });
  // 一级菜单和二级，
  Userk userk;
  bool isExpanded;

  //调用fromJson将一级对象数据，转换为Userk类
  factory Item.fromJson(Map<String, dynamic> json) {
    Userk userk = Userk.fromJson(json);
    return Item(userk: userk, isExpanded: false);
  }
}

class ExpansionPanelPage extends StatefulWidget {
  @override
  _ExpansionPanelPageState createState() => _ExpansionPanelPageState();
}

class _ExpansionPanelPageState extends State<ExpansionPanelPage> {
  List<Item> _datas;
  // 初始加载数据
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    // 获取数据
    GetHomePageData homedata = new GetHomePageData();
    await homedata.getHomePageContent();
    //组装json server获取数据，初始化页面数据
    setState(() {
      _datas = homedata.data.map((e) => Item.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('菜单'),
        ),
        body: SingleChildScrollView(
          child: _buildPanel(),
        ));
  }

  Widget _buildPanel() {
    // radio只能展开一个
    return ExpansionPanelList(
      //开关动画时长
      animationDuration: Duration(milliseconds: 500),
      // 开关回调
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          _datas[panelIndex].isExpanded = !isExpanded;
        });
      },
      //内容区,使用 ExpansionPanel 实现展开效果，此处返回一个List<ExpansionPanel>
      children: _datas.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return ListTile(
                contentPadding: EdgeInsets.all(10.0),
                // 设置一级菜单名
                title: Text(item.userk.name),
              );
            },
            body: Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: ListView.builder(
                itemCount: item.userk.children.length,
                itemBuilder: (BuildContext context, int position) {
                  // 设置二级菜单
                  return getRow(position, item);
                },
              ),
            ),
            isExpanded: item.isExpanded,
            canTapOnHeader: true);
      }).toList(),
    );
  }

  // 设置二级菜单
  Widget getRow(int i, Item item) {
    return new GestureDetector(
      child: new ListTile(
        title: new Text(item.userk.children[i].name,
            style: TextStyle(color: Colors.blue)),
        // 副标题
        subtitle: Text(item.userk.children[i].title),
        // trailing: new Icon(
        //   Icons.chevron_right,
        //   color: Colors.black26,
        // ),
        trailing: Icon(Icons.delete),
        onTap: () {
          print(item.userk.children[i].name);
          // 删除
          setState(() {
            item.userk.children.removeWhere(
                (user) => user.name == item.userk.children[i].name);
          });
        },
      ),
    );
  }
}
