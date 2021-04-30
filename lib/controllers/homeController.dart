import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString stateStr = "".obs;

  void changeStr(){
    stateStr.value += "--";
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}