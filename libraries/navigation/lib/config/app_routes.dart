
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'route_handlers.dart';
//All Aplication Routes will managed here
class Routes {
  static String root = "/";
  static String searchDetail = "/searchDetail";
  static String demoSimpleFixedTrans = "/demo/fixedtrans";
  static String demoFunc = "/demo/func";
  static String deepLink = "/message";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
          return;
        });
    router.define(root, handler: searchHandler);
    router.define(searchDetail, handler: searchDetailHandler);

  }
}
