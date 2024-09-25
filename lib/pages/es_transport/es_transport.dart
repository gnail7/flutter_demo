import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pad_mes/api/es_server.dart';
import 'package:pad_mes/models/process.dart';
import 'package:pad_mes/widgets/button/button_with_type.dart';
import 'package:pad_mes/widgets/custom_model/custom_model.dart';
import 'package:pad_mes/widgets/empty_wrapper/empty_wrapper.dart';
import 'package:pad_mes/widgets/login_box/login_box.dart';


class EsTransport extends StatefulWidget {
  const EsTransport({super.key});
  _EsTransport createState () => _EsTransport();
}

class _EsTransport extends State {
  late List<dynamic> records = [];
  int? selectedStep; // 记录选中的 stepNo
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showCustomModal(context);
    });
    fetchTransList();
  }

  Future<void> fetchTransList() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    try {
      var response = await getQualityListByStatus();
      if (response['code'] == 1) {
        setState(() {
          records = response['data'];
        });
        print('response $response');
      }
    } finally {
      isLoading = false;
    }
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
              child: EmptyWrapper(
                  isEmpty: records.isEmpty,
                  child: ListView.builder(
                    itemCount: records.length, // 列表项的数量
                    itemBuilder: (context, index) {
                      var record = records[index];
                      final String statusLabel = _getTransportStatusLabel(record['status']);
                      final bool isSelected = selectedStep == record['transId'];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedStep = record['transId'];
                          });
                        },
                        child: Container(
                          color: isSelected ?  Colors.blue.withOpacity(0.2) : Colors.transparent, // 改变背景色
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${record['orderName']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold, // 当前工序字体加粗
                                  ),
                                ),
                                Chip(
                                  label: Text(statusLabel),
                                  avatar: const Icon(Icons.label), // 可选的图标
                                )
                              ],
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.start, // 左对齐
                              crossAxisAlignment: CrossAxisAlignment.center, // 垂直居中
                              children: [
                                Text(
                                  '${record['lineName']}: ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold, // 当前工序字体加粗
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                // 当前工序
                                Text(
                                  record['stepName']?.isNotEmpty == true ? record['stepName']! : '启动',
                                ),
                                // 箭头图标，只有当有下一工序时显示
                                if (record['nextStepName']?.isNotEmpty == true) ...[
                                  const SizedBox(width: 10), // 添加左右间距
                                  const Icon(
                                    Icons.arrow_right_alt,
                                    color: Colors.grey, // 箭头颜色
                                  ),
                                  const SizedBox(width: 10),
                                  // 下一工序
                                  Text(
                                    record['nextStepName']!,
                                  ),
                                ],
                                const Spacer(),
                                Text(
                                  record['workTime'] ?? '--', // 展示时间，如果没有则显示占位符
                                  style: const TextStyle(
                                    color: Colors.grey, // 设置时间文本颜色
                                    fontStyle: FontStyle.italic, // 斜体显示
                                  ),
                                ),
                              ],
                            ),
                            leading: Container(
                              width: 8.0, // 设置颜色条的宽度
                              color: _getTransportStatusColor(record['status']), // 设置颜色
                            ),
                          ),
                        ),
                      );
                    },
                  )
              )
          ),
          // 底部的操作按钮
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWithType(type: 'primary', child: Text('启动')),
                ButtonWithType(type: 'warning', child: Text('暂停')),
                ButtonWithType(type: 'success', child: Text('完成')),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Color _getTransportStatusColor (int type) {
    switch (type) {
      case 0:
        return Colors.orange; // 待转运的颜色
      case 1:
        return Colors.blue;   // 转运中的颜色
      case 2:
        return Colors.green;  // 已转运的颜色
      case 4:
        return Colors.red;    // 已暂停的颜色
      default:
        return Colors.grey;   // 默认颜色
    }
  }

  String _getTransportStatusLabel (int type) {
    switch (type) {
      case 0:
        return '待转运'; // 待转运
      case 1:
        return '转运中';   // 转运中的颜色
      case 2:
        return '已转运';  // 已转运的颜色
      case 4:
        return '已暂停';    // 已暂停的颜色
      default:
        return '';   // 默认颜色
    }
  }

  void _showCustomModal(BuildContext context) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('用户登录'),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 150, // 设置列表的高度
                      width: 100,
                      child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              const Text('user'),
                              IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      width: 100,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const TextField(
                            decoration: InputDecoration(
                              labelText: '请输入用户名',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20), // 添加间距
                          // 登录按钮
                          ElevatedButton(
                            onPressed: () {
                              // 按钮点击事件
                              // 在这里处理登录逻辑
                              print('登录按钮被点击');
                            },
                            child: const Text('登录'),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        );
      },
    );
  }
}