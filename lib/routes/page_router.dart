import 'package:fluro/fluro.dart';
import 'package:pad_mes/routes/page_routes.dart';

class PageRouter {
  static final router = FluroRouter();
  static setupRoutes() {
    pageRoutes.forEach((path, handler){
      router.define(path, handler: handler, transitionType: TransitionType.inFromRight);
    });
  }
}