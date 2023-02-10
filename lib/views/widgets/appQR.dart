import 'package:deviceweb/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:get/get.dart';
class AppQRCode extends StatelessWidget {
  // final String androidAppStr;
  // final String iosAppStr;
  // final String qrStr;
  // AppQRCode({this.androidAppStr = "this is the qr string",this.iosAppStr="this is the ios app store link",this.qrStr="this is the activated qr str"});
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // myQrWidget(androidAppStr,"安卓手机应用下载"),
            myQrWidget(homeController.androidQRStr.value,"安卓手机应用"),
            SizedBox(width: 40,),
            myQrWidget(homeController.iosQRStr.value,"苹果手机应用"),
            // myQrWidget(iosAppStr,"苹果手机应用下载"),
            SizedBox(width: 100,),
            // Expanded(child: SizedBox()),
            // myQrWidget(homeController.activateQRStr.value, "激活绑定设备"),
            // SizedBox(width: 40,),
            myQrWidget(homeController.wifiConfigStr.value, "配置无线网络"),
          ],
        ),
      );
    });
  }

  Widget myQrWidget(String qrString,String statementStr){
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: 200,
            maxWidth: 200,
          ),
          child: Card(
            child: QrImage(
              data: qrString,
              version: QrVersions.auto,
              size: 150,
              gapless: false,
            ),
          ),
        ),
        Text(statementStr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0,color: Colors.white),),
      ],
    );
  }
}
