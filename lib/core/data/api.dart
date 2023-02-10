import 'dart:convert';
import 'package:http/http.dart' as http;
import "apiUrl.dart";
class ClientAPI {

  Future<String> getAppQRStr() async {
    final res = await http.get(Uri.parse(APIUrl.getAppQRStr));
    final resJson=json.decode(res.body);
    return jsonEncode(resJson);
  }

  Future<Map<String,dynamic>> getActivateQRStr() async {
    final res = await http.get(Uri.parse(APIUrl.getActivateQRStr));
    final resJson=json.decode(res.body);
    print(resJson);
    if(resJson!=null){
      Map<String,dynamic> activateQR ={"act":"ad","code":resJson["activateCode"],"mac":resJson["deviceMAC"]};
      return activateQR;
    } else {
      return {};
    }

  }

  Future<String> updateNetworkStatus() async {
    Map<String,dynamic> networkStatus = {"connected":false,"message":"网络未连接","data":null};
    try{
      final res = await http.get(Uri.parse(APIUrl.internetHealthyCheck));
      final resJson=json.decode(res.body);
      if(resJson["success"]){
        networkStatus ={"connected":true,"message":"网络已连接","data":resJson["data"]};
      }
    } catch(e){
      throw e;
    }
    return jsonEncode(networkStatus);
  }

  Future<Map<String,dynamic>> getLocalIPAddress() async {
    final res = await http.get(Uri.parse(APIUrl.getLocalIPAddress));
    final resJson=json.decode(res.body);
    late Map<String,dynamic> networkStatus;
    if(res.statusCode==200){
      networkStatus =resJson;
    } else {
      networkStatus ={};
    }
    return networkStatus;
  }


  Future<String> getInstructionVideoUrl() async {
    // final res = await http.post(Uri.parse(APIUrl.getActivateQRStr));
    // final resJson=json.decode(res.body);
    // return resJson.toString();
    // Map<String,dynamic> instructionVideoUrl ={"update":true,"source":"remote","url":"https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4"};
    Map<String,dynamic> instructionVideoUrl ={"update":true,"source":"remote","url":"assets/videos/device_demo.mp4"};
    return jsonEncode(instructionVideoUrl);
  }

  Future<List<String>> getADStr() async {
    // final res = await http.post(Uri.parse(APIUrl.getActivateQRStr));
    // final resJson=json.decode(res.body);
    // return resJson.toString();
    List<String> adStr = [
      "任意显示屏幕适配，即插即用",
      "丰富的应用模版，远程应用推送，及时更新媒体素材",
      "便捷的终端管理软件，支持手机，平板，电脑，网页多终端",
      "云端设备监测，随时查阅设备状态",
      "低功耗硬件，节省运营成本",
    ];
    return adStr;
  }

  // Future<bool> registerStatus() async {
  //   final res = await http.get(Uri.parse(APIUrl.deviceIsInitialized));
  //   final resJson=json.decode(res.body);
  //   if (resJson["success"] == true) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  Future<bool> deviceIsActivated() async {
    final res = await http.get(Uri.parse(APIUrl.deviceIsActivated));
    final resJson=json.decode(res.body);
    if (resJson["success"] == true) {
      return true;
    } else {
      return false;
    }
  }



  Future<String> getBleServiceName() async {
    final res = await http.get(Uri.parse(APIUrl.getBleServiceName));
    final resJson=jsonDecode(res.body);
    if (resJson["ble"] !=null) {
      return resJson["ble"];
    } else {
      return "";
    }
  }



}