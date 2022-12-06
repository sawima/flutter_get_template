import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import '../core/data/api.dart';
import 'package:deviceweb/core/models/networkModel.dart';

class HomeController extends GetxController {
  RxBool networkStatus = false.obs;
  RxString networkConnectionStr = "".obs;
  RxString ipAddress = "127.0.0.1".obs;
  RxString clientID = "".obs;
  // RxString registerQRStr = "".obs;
  RxString androidQRStr = "".obs;
  RxString iosQRStr = "".obs;
  RxString instructionVideoUrl = "assets/videos/video.mp4".obs;
  RxString instructionVideoType = "local".obs;
  RxString activateQRStr = "".obs;
  RxString wifiConfigStr = "".obs;
  RxBool registerStatus = false.obs;
  RxString registerMsg = "未注册".obs;
  RxString bleString = "".obs;
  Rx<NetworkModel> networkInfo = NetworkModel.fromJson({
    "wifi":{
      "ip":"0.0.0.0",
      "mac":"ff:ff:ff:ff:ff",
      "name":"wifi"
    },
    "eth0":{
      "ip":"0.0.0.0",
      "mac":"ff:ff:ff:ff:ff",
      "name":"cable"
    }
  }).obs;
  RxBool loadingStatus = true.obs;
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
    // Future.delayed(const Duration(seconds: 5),(){loadingStatus.value = true;});
    clientApi.getAppQRStr().then((result){
      Map<String,dynamic> appQRResult = jsonDecode(result);
      androidQRStr.value = appQRResult["androidQR"];
      iosQRStr.value = appQRResult["iosQR"];
    });
    clientApi.getBleServiceName().then((result){
      bleString.value = result;
    });
    clientApi.getActivateQRStr().then((result){
      activateQRStr.value = result;
      final activateObj = json.decode(result);
      if(activateObj["deviceMAC"]!=null){
        wifiConfigStr.value = json.encode({"action":"wifiConfig","thingName":activateObj["deviceMAC"]});
      } else{
        wifiConfigStr.value = json.encode({"action":"wifiConfig","thingName":"unknown"});
      }
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
    });
    Timer.periodic(Duration(seconds: 10), (timer) async {
      print("interval trigger network status");
      final networkState = await clientApi.updateNetworkStatus();
      final ipAddresses = await clientApi.getLocalIPAddress();
      Map<String,dynamic> networkResult = jsonDecode(networkState);
      networkStatus.value = networkResult["connected"] as bool;
      networkConnectionStr.value = networkResult["message"];
      if(ipAddresses.isNotEmpty){
        networkInfo.value = NetworkModel.fromJson(ipAddresses);
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

}