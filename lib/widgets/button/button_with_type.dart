import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWithType extends StatelessWidget {
  const ButtonWithType({super.key, required this.type, required this.child});

  // type用来定义按钮的类型
  final String type; // 不再允许为null

  // child是按钮的子组件，用来显示按钮的内容，比如文字或图标
  final Widget child;

  // 定义按钮的点击事件
  void onPressed() {
    switch (type) {
      case 'submit':
        print('提交按钮被点击');
        break;
      case 'cancel':
        print('取消按钮被点击');
        break;
      default:
        print('其他类型按钮被点击');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // 按钮点击事件
      child: _getStyledChild(child), // 处理后的child
      style: ElevatedButton.styleFrom(
        backgroundColor: _getButtonColor(), // 根据类型返回按钮的颜色
      ),
    );
  }

  // 根据按钮的类型返回不同的颜色
  Color _getButtonColor() {
    switch (type) {
      case 'primary':
        return Colors.blue;  // 主按钮使用蓝色
      case 'warning':
        return Colors.orangeAccent; // 警告按钮使用橙色
      case 'info':
        return Colors.lightBlue; // 信息按钮使用浅蓝色
      case 'danger':
        return Colors.red;   // 取消按钮使用红色
      case 'success':
        return Colors.green;
      default:
        return Colors.grey;  // 默认按钮使用灰色
    }
  }

  // 根据按钮类型返回对应的文字样式
  TextStyle _getTextStyle() {
    switch (type) {
      case 'primary':
        return const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
      case 'warning':
        return const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
      case 'info':
        return const TextStyle(color: Colors.black, fontWeight: FontWeight.normal);
      case 'cancel':
        return const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
      case 'success':
        return const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
      default:
        return const TextStyle(color: Colors.black, fontWeight: FontWeight.normal);
    }
  }

  // 处理child并应用相应的文字样式
  Widget _getStyledChild(Widget child) {
    if (child is Text) {
      return Text(
        child.data ?? '',
        style: _getTextStyle(), // 应用相应的文字样式
      );
    }
    return child; // 如果不是Text，直接返回
  }
}
