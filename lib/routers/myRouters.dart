import 'package:get/get.dart';
import '../views/connect_network.dart';
import '../views/home.dart';

class MyRouters{
  static final String main= "/";
  static final String network= "/network";
  static final String active= "/active";
  // static final String pageRouter= "/";
  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => HomePage()),
    GetPage(name: network, page: () => ConnectNetworkPage()),
    // GetPage(name: pageRouter, page: () => PageRouterPage()),
  ];
}