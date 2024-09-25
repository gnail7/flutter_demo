import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectPage extends StatelessWidget {
  SelectPage({super.key});
  List<Map<String, dynamic>> pages= [
    {'pageName': 'esRoutine', 'pageLabel': '集装箱常规'},
    {'pageName': 'esTransport', 'pageLabel': '集装箱转运'},
    {'pageName': 'esQi', 'pageLabel': '集装箱质检'}
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('页面菜单'),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
        actions: [
          ElevatedButton(
            onPressed: () {
              // 按钮点击事件

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 设置背景颜色
            ),
            child: const Icon(
              Icons.bluetooth,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: GridView(
        padding: EdgeInsets.only(top: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //横轴三个子widget
            childAspectRatio: 1.5, //宽高比为1时，子widget
            mainAxisSpacing: 8.0, // 主轴（纵向）间隔
            crossAxisSpacing: 8.0,
        ),
        children: pages.map((page) => TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue[400], // 设置按钮的背景颜色
            shape: const RoundedRectangleBorder( // 设置形状为直角矩形
              borderRadius: BorderRadius.all(Radius.circular(10)), // 直角矩形
            ),
          ),
          onPressed: () {
            String pageName = page['pageName'];
            Navigator.pushNamed(context, '/$pageName');
          },
          child: Text(page['pageLabel'], style: const TextStyle(color: Colors.white),)
        ),).toList(),
      ),
    );
  }
}