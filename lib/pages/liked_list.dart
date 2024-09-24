import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pad_mes/states/mock_provider.dart';
import 'package:provider/provider.dart';

class LikedList extends StatefulWidget {
  const LikedList();
  @override
  _LikedList createState() => _LikedList();
}

class _LikedList extends State{
  @override
  Widget build(BuildContext context) {
    final mockProvider = Provider.of<MockProvider>(context);
    final items = mockProvider.goods?.where((good) => good['isFavorite']).toList() ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked Products'), // 更改标题为更具描述性
      ),
      body: ListView.builder(
        itemCount: items!.length , // 使用过滤后的项目数量
        itemBuilder: (context, index) {
          final product = items[index]; // 使用过滤后的项目
          return ListTile(
            title: Text(product['name']),
            subtitle: Text(product['description']),
            trailing: const Icon(
              Icons.favorite, // 直接显示收藏图标
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}