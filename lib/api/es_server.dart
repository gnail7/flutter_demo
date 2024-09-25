import 'package:pad_mes/common/request.dart';

// 获取转运列表
Future<dynamic> getQualityListByStatus() async {
  return await HttpApi.request('/transRecord/getTransRecord', method: 'GET');
}