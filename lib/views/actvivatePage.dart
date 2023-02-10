import 'dart:convert';

import 'package:deviceweb/views/widgets/networkStatus.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/homeController.dart';
import 'package:get/get.dart';

import '../utils/direction.dart';

class ActivatePage extends StatelessWidget {
  ActivatePage({Key? key}) : super(key: key);

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final appQRWidth = Get.width / 8;
    final qrVerticalWidth = Get.width/5;
    final double mgLR = Get.width / 15;
    return DirectionPattern(
      horizontalWidget: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(color: Colors.blue),
          child: Stack(
            children: [
              NetworkStatus(),
              Container(
                margin: EdgeInsets.fromLTRB(mgLR, 60, mgLR, 0),
                height: Get.height,
                width: Get.width,
                // decoration: BoxDecoration(color: Colors.cyan),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "激活/绑定设备",
                      style: TextStyle(fontSize: 48, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Obx(() {
                                final activeQRStr = homeController.activateQRStr.value;
                                var qrStr = {};
                                var activatedCode="empty";
                                if(activeQRStr.isNotEmpty){
                                  qrStr = jsonDecode(homeController.activateQRStr.value);
                                  activatedCode =qrStr["code"];
                                }
                                return Wrap(
                                  direction: Axis.horizontal,
                                  crossAxisAlignment: WrapCrossAlignment.end,
                                  children: [
                                    Text(
                                      "设备激活码: ",
                                      style: TextStyle(
                                          fontSize: 28, color: Colors.white),
                                    ),
                                    Text(
                                      activatedCode,
                                      style: TextStyle(
                                          fontSize: 32,
                                          color: Colors.greenAccent),
                                    ),
                                  ],
                                );
                              }),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "1. 打开手机扫一扫功能",
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                              ),
                              Text(
                                "2. 扫描右侧激活二维码",
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                              ),
                              Text(
                                "3. 将设备绑定至团队和制定设备位置组",
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                              ),
                              Text(
                                "4. 尝试投播媒体或部署安装节目应用",
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "或者登陆网页端「https://c.kimacloud.com.cn」,输入设备激活码",
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Card(
                              child: QrImage(
                                data: homeController.activateQRStr.value,
                                version: QrVersions.auto,
                                size: Get.width / 6,
                                gapless: false,
                              ),
                            ),
                            Text(
                              "扫一扫,设备激活二维码",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      width: Get.width,
                      child: Container(
                        width: 800,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "安卓手机应用",
                                  style: TextStyle(
                                      fontSize: 42, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Card(
                                  child: QrImage(
                                    data: homeController.androidQRStr.value,
                                    version: QrVersions.auto,
                                    size: appQRWidth,
                                    gapless: false,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "苹果手机应用",
                                  style: TextStyle(
                                      fontSize: 42, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Card(
                                  child: QrImage(
                                    data: homeController.iosQRStr.value,
                                    version: QrVersions.auto,
                                    size: appQRWidth,
                                    gapless: false,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                child: Container(
                  height: 120,
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/images/1m2_logo.png'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      verticalWidget: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(color: Colors.blue),
        child: Stack(
          children: [
            NetworkStatus(),
            Container(
              margin: EdgeInsets.fromLTRB(mgLR,40,mgLR,0),
              height: Get.height,
              width: Get.width,
              // decoration: BoxDecoration(color: Colors.cyan),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("激活/绑定设备",style: TextStyle(fontSize: 48,color: Colors.white),),
                  const SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx((){
                              final activeQRStr = homeController.activateQRStr.value;
                              var qrStr = {};
                              var activatedCode="empty";
                              if(activeQRStr.isNotEmpty){
                                qrStr = jsonDecode(homeController.activateQRStr.value);
                                activatedCode =qrStr["code"];
                              }
                              return Wrap(
                                direction: Axis.horizontal,
                                crossAxisAlignment: WrapCrossAlignment.end,
                                children: [
                                  Text("设备激活码: ",style: TextStyle(fontSize: 28,color: Colors.white),),
                                  Text(activatedCode,style: TextStyle(fontSize: 32,color: Colors.greenAccent),),
                                ],
                              );
                            }),
                            const SizedBox(height: 10,),
                            Text("1. 打开手机扫一扫功能",style: TextStyle(fontSize: 28,color: Colors.white),),
                            Text("2. 扫描右侧激活二维码",style: TextStyle(fontSize: 28,color: Colors.white),),
                            Text("3. 将设备绑定至团队和制定设备位置组",style: TextStyle(fontSize: 28,color: Colors.white),),
                            Text("4. 尝试投播媒体或部署安装节目应用",style: TextStyle(fontSize: 28,color: Colors.white),),
                            const SizedBox(height: 10,),
                            Text("或者登陆网页端「https://c.kimacloud.com.cn」,输入设备激活码",style: TextStyle(fontSize: 28,color: Colors.white),),
                          ],
                        ),
                      ),
                      // const SizedBox(width: 40,),

                    ],
                  ),
                  const SizedBox(height: 40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        child: QrImage(
                          data: homeController.activateQRStr.value,
                          version: QrVersions.auto,
                          size: Get.width/4,
                          gapless: false,
                        ),
                      ),
                      Text("扫一扫,设备激活二维码",style: TextStyle(fontSize: 18,color: Colors.white),)
                    ],
                  ),
                  const SizedBox(height: 60,),
                  Container(
                    width: Get.width,
                    child: Container(
                      width: 800,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("安卓手机应用",style: TextStyle(fontSize: 42,color: Colors.white),),
                              const SizedBox(height: 10,),
                              Card(
                                child: QrImage(
                                  data: homeController.androidQRStr.value,
                                  version: QrVersions.auto,
                                  size: qrVerticalWidth,
                                  gapless: false,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 100,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("苹果手机应用",style: TextStyle(fontSize: 42,color: Colors.white),),
                              const SizedBox(height: 10,),
                              Card(
                                child: QrImage(
                                  data: homeController.iosQRStr.value,
                                  version: QrVersions.auto,
                                  size:  qrVerticalWidth,
                                  gapless: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(bottom: 10,left: 0,child: Container(
              height: 120,
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/images/1m2_logo.png'),
                ],
              ),
            ),),
          ],
        ),
      ),
    );
  }
}
