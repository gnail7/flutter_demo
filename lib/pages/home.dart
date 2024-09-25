import 'package:flutter/material.dart';
import 'package:pad_mes/pages/choose_location.dart';
import 'package:pad_mes/pages/liked_list.dart';
import 'package:pad_mes/pages/mock_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0; // 当前选中的标签页索引

  final List<Widget> _pages = [
    ChooseLocation(),
    const MockList(),
    const LikedList(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index; // 更新当前索引
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomTabBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped, // 传递点击事件处理函数
      ),
      body: SafeArea(
        child: _pages[_currentIndex], // 显示当前页面
      ),
    );
  }
}

class BottomTabBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap; // 修改为 ValueChanged<int> 类型

  BottomTabBar({super.key, required this.currentIndex, required this.onTap}); // 添加 onTap 参数

  final List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Goods',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Liked Goods',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _items,
      currentIndex: currentIndex, // 设置当前索引
      onTap: onTap, // 处理点击事件
      type: BottomNavigationBarType.fixed, // 设置类型
    );
  }
}
