import 'package:fluro/fluro.dart';
import 'package:pad_mes/pages/select_page/select_page.dart';
import 'package:pad_mes/pages/es_transport/es_transport.dart';
import 'package:pad_mes/pages/login_page.dart';
import 'package:pad_mes/pages/navigation_page/navigation_page.dart';

// 定义路由处理器
final Map<String, Handler> pageRoutes = {
  // 查看源码可以知道Handler有两种类型，一种是route,一种是function.route就是添加路由，function就是添加拦截器
  "/": Handler(handlerFunc: (context, Map<String, List<String>> params) =>  const LoginPage()),
  "/esTransport": Handler(handlerFunc: (context, Map<String, List<String>> params) =>  EsTransport()),
  '/navigationPage': Handler(handlerFunc: (context, Map<String, List<String>> params) => const NavigationPage()),
  '/selectPage': Handler(handlerFunc: (context, Map<String, List<String>> params) => SelectPage()),
};
