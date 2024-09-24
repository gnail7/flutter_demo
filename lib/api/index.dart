// 登录接口
import 'package:pad_mes/common/request.dart';

// 根据ip获取工位信息
Future<dynamic> getWorkstationIp(String ip) async {
  return await HttpApi.request('/workstation/ip/$ip', method: 'GET');
}

// 根据手机号或者工号登录
Future<dynamic> userloginByPhoneOrId(String identityCode) async {
  return await HttpApi.request('/user/getUserInfo/$identityCode}', method: 'GET');
} 