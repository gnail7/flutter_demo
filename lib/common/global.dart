import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pad_mes/routes/page_router.dart';
import 'package:pad_mes/states/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

const _themes = <Color>[
  Color(0xFF2196F3), // 蓝色
  Color(0xFF00BCD4), // 青色
  Color(0xFF009688), // 水鸭色
  Color(0xFF4CAF50), // 绿色
  Color(0xFFF44336), // 红色
];

// 路由初始化以及持久化存储
class Global {
  // 判断是否上线环境
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  static Future<void> init() async {
    //确保Flutter环境已初始化
    PageRouter.setupRoutes();
    WidgetsFlutterBinding.ensureInitialized();
  }
}

/// 获取设备当前的 IP 地址
Future<String?> getIpAddress() async {
  // 检查网络连接状态
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    return 'No network connection';
  }

  try {
    // 遍历所有网络接口
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4) {
          return addr.address; // 返回第一个找到的 IPv4 地址
        }
      }
    }
  } catch (e) {
    return 'Failed to get IP address: $e';
  }

  return 'IP address not found';
}
