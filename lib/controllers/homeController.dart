import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import '../core/data/api.dart';

class HomeController extends GetxController {
  RxBool networkStatus = false.obs;
  RxString networkConnectionStr = "".obs;
  RxString ipAddress = "127.0.0.1".obs;
  RxString clientID = "".obs;
  RxString registerQRStr = "".obs;
  RxString androidQRStr = "".obs;
  RxString iosQRStr = "".obs;
  RxString instructionVideoUrl = "assets/videos/video.mp4".obs;
  RxString instructionVideoType = "local".obs;
  RxString activateQRStr = "".obs;
  RxBool registerStatus = false.obs;
  RxString registerMsg = "未注册".obs;
  // RxList<String> adListStr = <String>[].obs;
  RxList<String> adListStr = [
    "多种显示屏幕适配，即插即用!",
    "丰富的应用模版，远程应用推送更新",
    "便捷的终端管理软件，支持手机，平板，电脑，网页多终端管理",
    "云端设备监测，随时查阅设备状态",
    // "低功耗硬件，节省运营成本",
  ].obs;
  final clientApi = ClientAPI();
  late final Timer timer;

  HomeController(){
    clientApi.getAppQRStr().then((result){
      Map<String,dynamic> appQRResult = jsonDecode(result);
      androidQRStr.value = appQRResult["androidQR"];
      iosQRStr.value = appQRResult["iosQR"];
    });
    clientApi.getActivateQRStr().then((result){
      activateQRStr.value = result;
    });

    clientApi.registerStatus().then((result){
      registerStatus.value = result;
      if(result){
        registerMsg.value = "已注册";
      }
    });

    clientApi.getADStr().then((result){
      adListStr.value = result;
    });

    clientApi.getInstructionVideoUrl().then((result){
      Map<String,dynamic> instructionVideoResult = jsonDecode(result);
      if(instructionVideoResult["update"]){
        instructionVideoType.value = instructionVideoResult["source"];
        instructionVideoUrl.value = instructionVideoResult["url"];
      }
    });
    clientApi.updateNetworkStatus().then((result){
      Map<String,dynamic> networkResult = jsonDecode(result);
      networkStatus.value = networkResult["connected"] as bool;
      networkConnectionStr.value = networkResult["message"];
      ipAddress.value = networkResult["data"]["ip"];
      clientID.value =  networkResult["data"]["mac"].toString().split(":").join();
      registerQRStr.value = jsonEncode({"action":"register","clientID":clientID.value});
    });
    Timer.periodic(Duration(seconds: 600), (timer) {
      print("interval trigger network status");
      clientApi.updateNetworkStatus().then((result){
        Map<String,dynamic> networkResult = jsonDecode(result);
        networkStatus.value = networkResult["connected"] as bool;
        networkConnectionStr.value = networkResult["message"];
        ipAddress.value = networkResult["data"]["ip"];
        clientID.value =  networkResult["data"]["mac"].toString().split(":").join();
        registerQRStr.value = jsonEncode({"action":"register","clientID":clientID.value});
      });
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    timer.cancel();
    super.onClose();
  }

}