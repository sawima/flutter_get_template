import 'package:deviceweb/views/network.dart';
// import 'package:deviceweb/views/pageRouter.dart';
import 'package:get/get.dart';
import '../views/home.dart';

class MyRouters{
  static final String main= "/";
  static final String network= "/network";
  static final String active= "/active";
  // static final String pageRouter= "/";
  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => HomePage()),
    GetPage(name: network, page: () => NetworkConfigPage()),
    // GetPage(name: pageRouter, page: () => PageRouterPage()),
  ];
}