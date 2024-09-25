import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pad_mes/states/mock_provider.dart';
import 'package:provider/provider.dart';

class MockList extends StatefulWidget {
  const MockList({super.key});
  @override
  _MockList createState() => _MockList();
}

class _MockList extends State{
  @override
  Widget build(BuildContext context) {
    final mockProvider = Provider.of<MockProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('产品列表'),
      ),
      body: ListView.builder(
        itemCount: mockProvider.goods?.length ?? 0,
        itemBuilder: (context, index) {
          final product = mockProvider.goods![index];
          return ListTile(
            title: Text(product['name']),
            subtitle: Text(product['description']),
            trailing: InkWell(
              onTap: () {
                // 切换收藏状态
                setState(() {
                  product['isFavorite'] = !product['isFavorite'];
                });
              },
              child: Icon(
                product['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                color: product['isFavorite'] ? Colors.red : null,
              ),
            ),
          );
        },
      ),
    );
  }
}