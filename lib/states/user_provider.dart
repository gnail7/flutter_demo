import 'package:flutter/material.dart';
import 'package:pad_mes/api/index.dart';
import 'package:pad_mes/common/request.dart';
import 'package:pad_mes/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  User? _user; // 当前用户信息
  List<User> _userList = [];
  // 对外提供getter
  User? get user => _user; // 获取用户信息

  // 更新用户信息
  List<User> get userList => _userList;

  void updateUser({String? name, String? workstationNo, String? pageName}) {
    _user = User(username: name, workstationNo: workstationNo, pageName: pageName);
    notifyListeners(); // 通知监听者更新
  }
  void addUser() {

  }

  void removeUser() {

  }

  Future<String> getWorkerInfo(String wifiIpAddress) async {
    var response = await getWorkstationIp('192.168.137.230');
    if (response['code'] != 1) {
      throw '请求出现问题';
    } else {
      String pageName = response['data']['pageName'];
      String workstationNo = response['data']['workstationNo'];
      updateUser(workstationNo: workstationNo, pageName: pageName);
      return pageName;
    }
  }

  Future<String> getLocalPageName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString('pageName'); // 获取 'pageName'
    return value ?? 'selectPage'; // 如果为 null，返回默认值 'defaultPage'
  }

}
