import 'dart:convert';
// import 'package:http/http.dart' as http;
// import "apiUrl.dart";
import 'dart:math';
class ClientAPI {

  Future<String> getAppQRStr() async {
    // final res = await http.post(Uri.parse(APIUrl.getAppQRStr));
    // final resJson=json.decode(res.body);
    // return resJson.toString();
    Map<String,dynamic> appQR ={"android":"android str","ios":"ios str"};

    return jsonEncode(appQR);
  }

  Future<String> getActivateQRStr() async {
    // final res = await http.post(Uri.parse(APIUrl.getActivateQRStr));
    // final resJson=json.decode(res.body);
    // return resJson.toString();
    Map<String,dynamic> activateQR ={"deviceMAC":"abcdedfh","activateCode":"123123"};

    return jsonEncode(activateQR);
  }

  Future<String> updateNetworkStatus() async {
    // final res = await http.post(Uri.parse(APIUrl.getActivateQRStr));
    // final resJson=json.decode(res.body);
    // return resJson.toString();
    Map<String,dynamic> networkStatus ={"connected":true,"message":"网络已经连接"};

    Random random = new Random();
    int randomNumber = random.nextInt(100);

    if(randomNumber.isOdd){
     networkStatus ={"connected":false,"message":"网络未连接"};
    }

    return jsonEncode(networkStatus);
  }

  Future<String> getInstructionVideoUrl() async {
    // final res = await http.post(Uri.parse(APIUrl.getActivateQRStr));
    // final resJson=json.decode(res.body);
    // return resJson.toString();

    // Map<String,dynamic> instructionVideoUrl ={"update":true,"source":"remote","url":"https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4"};
    Map<String,dynamic> instructionVideoUrl ={"update":true,"source":"remote","url":"assets/videos/video.mp4"};

    return jsonEncode(instructionVideoUrl);
  }

  Future<List<String>> getADStr() async {
    // final res = await http.post(Uri.parse(APIUrl.getActivateQRStr));
    // final resJson=json.decode(res.body);
    // return resJson.toString();
    List<String> adStr = [
      "多种显示屏幕适配，即插即用",
      "丰富的应用模版，远程应用推送,及时更新媒体素材",
      "便捷的终端管理软件，支持手机，平板，电脑，网页多终端",
      "云端设备监测，随时查阅设备状态",
      "低功耗硬件，节省运营成本",
    ];
    return adStr;
  }


}