import 'package:get/get.dart';
import '../views/home.dart';

class MyRouters{
  static final String main= "/";
  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => HomePage()),
  ];
}