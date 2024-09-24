import 'package:flutter/widgets.dart';

List<Map<String, dynamic>> productList = [
  {
    'name': '智能手表',
    'description': '这款智能手表具有心率监测、GPS定位和多种运动模式。',
    'isFavorite': false,
  },
  {
    'name': '无线耳机',
    'description': '高品质音质，支持蓝牙5.0，长达20小时的电池续航。',
    'isFavorite': true,
  },
  {
    'name': '便携式充电宝',
    'description': '小巧轻便，支持快充，容量为10000mAh。',
    'isFavorite': false,
  },
  {
    'name': '4K高清摄像头',
    'description': '高分辨率摄像头，适合视频会议和直播使用。',
    'isFavorite': true,
  },
  {
    'name': '智能家居音箱',
    'description': '支持语音控制，可以控制智能家居设备。',
    'isFavorite': false,
  },
  {
    'name': '健身瑜伽垫',
    'description': '环保材料制成，防滑设计，适合各种瑜伽练习。',
    'isFavorite': true,
  },
  {
    'name': '旅行背包',
    'description': '大容量设计，适合短途旅行，防水材料。',
    'isFavorite': false,
  },
  {
    'name': '蓝牙音响',
    'description': '强劲低音，适合户外使用，防水设计。',
    'isFavorite': true,
  },
];

class MockProvider with ChangeNotifier{
  List<dynamic>? _goods;

  MockProvider() {
    _goods = productList; // 初始化为模拟数据
  }

  List? get goods => _goods;

  void updateGoods(List<dynamic> goods) {
    _goods = goods;
    notifyListeners();
  }
}
