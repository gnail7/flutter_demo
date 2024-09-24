import 'package:flutter/material.dart';

class CustomModal extends StatelessWidget {
  final Widget child;

  final String title; // 接收一个 Widget 作为参数

  const CustomModal({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: child, // 将传入的 Widget 放入模态框中
      actions: [],
    );
  }
}
