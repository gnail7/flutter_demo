import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWithType extends StatelessWidget {
  const ButtonWithType({super.key, this.type, required this.child});

  // type用来定义按钮的类型，可以根据需求做不同的处理
  final String? type;

  // child是按钮的子组件，用来显示按钮的内容，比如文字或图标
  final Widget child;

  // 定义按钮的点击事件
  void onPressed() {
    if (type == 'submit') {
      print('提交按钮被点击');
    } else if (type == 'cancel') {
      print('取消按钮被点击');
    } else {
      print('其他类型按钮被点击');
    }
  }

  @override
  Widget build(BuildContext context) {
    // 使用 ElevatedButton，并根据传入的类型展示不同的行为
    return ElevatedButton(
      onPressed: onPressed, // 按钮点击事件
      child: child,         // 按钮显示的内容
      style: ElevatedButton.styleFrom(
        backgroundColor: _getButtonColor(), // 根据类型返回按钮的颜色
      ),
    );
  }

  // 根据按钮的类型返回不同的颜色
  Color _getButtonColor() {
    switch (type) {
      case 'submit':
        return Colors.blue;  // 提交按钮使用蓝色
      case 'cancel':
        return Colors.red;   // 取消按钮使用红色
      default:
        return Colors.grey;  // 默认按钮使用灰色
    }
  }
}
