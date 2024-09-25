import 'package:dio/dio.dart';
import 'package:pad_mes/common/global.dart';

class HttpApi {
  // 配置基本的请求选项
  static final BaseOptions options = BaseOptions(
    baseUrl: Global.isRelease ? 'http://139.9.199.220:8182/' : 'http://139.9.199.220:8182/',
    method: 'POST',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    headers: {
      'User-Agent': 'Dio',
    },
  );
  static Dio dio = Dio(options);

  static Future<T> request<T>(String url, {String method = "POST", dynamic? params}) async {
    final options = Options(method: method);

    // 添加拦截器
    Interceptor inter = InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // 检查 response.data.code
        if (response.data['code'] != 1) {
          return handler.reject(DioError(
            requestOptions: response.requestOptions,
            response: response,
            error: 'Error: ${response.data['message'] ?? 'Unknown error'}',
          ));
        }
        return handler.next(response);
      },
      onError: (e, handler) {
        print(e);
        return handler.next(e);
      },
    );

    List<Interceptor> inters = [];
    inters.add(LogInterceptor());
    dio.interceptors.addAll(inters);

    // 发起网络请求
    try {
      Response response = await dio.request<T>(url, queryParameters: params, options: options);
      return response.data;
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }
}
