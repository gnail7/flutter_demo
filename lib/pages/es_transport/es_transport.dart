import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pad_mes/widgets/custom_model/custom_model.dart';
import 'package:pad_mes/widgets/login_box/login_box.dart';

class EsTransport extends StatefulWidget {
  EsTransport({super.key});
  _EsTransport createState () => _EsTransport();
}

class _EsTransport extends State {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showCustomModal(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('集装箱转运'),
      ),
      body: Column(
        children: [
          // 列表部分
          Expanded(
            child: ListView.builder(
              itemCount: 10, // 列表项的数量
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                  subtitle: Text('This is item number $index'),
                );
              },
            ),
          ),
          // 底部的操作按钮
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Button 1 pressed');
                  },
                  child: Text('启动'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Button 2 pressed');
                  },
                  child: Text('暂停'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Button 3 pressed');
                  },
                  child: Text('完成'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCustomModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomModal(
          title: '用户登录',
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: LoginBox(),
                  flex: 1,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}