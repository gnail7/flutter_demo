import 'package:flutter/material.dart';

class EmptyWrapper extends StatelessWidget {
  const EmptyWrapper({
    super.key,
    required this.child,
    required this.isEmpty,
    this.emptyText = 'No Data Available',
  });

  final Widget child;
  final bool isEmpty;
  final String emptyText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isEmpty
          ? Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(emptyText), // 显示空数据文本
                const SizedBox(height: 10),
                const Icon(Icons.hourglass_empty),
              ],
            ),
          ),
        ],
      )
          : child, // 如果不为空，显示传入的 child
    );
  }
}
