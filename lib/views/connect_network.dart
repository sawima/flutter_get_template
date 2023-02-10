import 'package:flutter/material.dart';
import 'package:deviceweb/utils/direction.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/homeController.dart';

class ConnectNetworkPage extends StatelessWidget {
  ConnectNetworkPage({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final storyAreaWidth = (Get.width-100)/2;
    final storyAreaHeight = (Get.height-300);
    final qrAreaWidth = (Get.width-100)/2;
    //vertical display
    final storyAreaVWidth = Get.width-100;
    return DirectionPattern(horizontalWidget: Container(
      padding: const EdgeInsets.fromLTRB(50,50,50,0),
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.blue
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("配置设备网络",style: TextStyle(fontSize: 48,color: Colors.white),),
          const SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 50),
                height: storyAreaHeight,
                width: storyAreaWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(Icons.wifi,size: 48,color: Colors.white,),
                        SizedBox(width: 8,),
                        Text("无线网络配置",style: TextStyle(fontSize: 36,color: Colors.white),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Text("步骤一：扫描右侧手机二维码下载并安装应用，或在手机应用商店搜索「旷云商显」",style: TextStyle(fontSize: 20,color: Colors.white),),
                    Text("步骤二：使用手机号码注册并登陆手机应用",style: TextStyle(fontSize: 20,color: Colors.white),),
                    Text("步骤三：使用手机主页右上角下拉菜单中的「设备网络」打开设备地址配置页面",style: TextStyle(fontSize: 20,color: Colors.white),),
                    Obx((){
                      final bleString = homeController.bleString.value;
                      return Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text("步骤四：开启手机蓝牙并搜索并连接设备名为",style: TextStyle(fontSize: 20,color: Colors.white),),
                          Text("「$bleString」",style: TextStyle(fontSize: 24,color: Colors.greenAccent),),
                          Text("的设备",style: TextStyle(fontSize: 20,color: Colors.white),),
                        ],
                      );
                    }),
                    Text("步骤五：设置并保存设备无线网络",style: TextStyle(fontSize: 20,color: Colors.white),),
                    const SizedBox(height: 50,),
                    Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(Icons.cable_outlined,size: 48,color: Colors.white,),
                        SizedBox(width: 8,),
                        Text("配置有线网络",style: TextStyle(fontSize: 36,color: Colors.white),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Text("通过网线连接设备，设备通过自动获取网络地址访问网络",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ],
                ),
              ),
              Container(
                // padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                height: storyAreaHeight,
                width: qrAreaWidth,
                decoration: BoxDecoration(
                    // color: Colors.white,
                  border: Border(
                    left: BorderSide(
                      color: Colors.white,
                      width: 2
                    )
                  )
                ),
                child: Obx((){
                  final androidQRString = homeController.androidQRStr.value;
                  final appleQRString = homeController.iosQRStr.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("安卓手机应用",style: TextStyle(fontSize: 42,color: Colors.white),),
                      const SizedBox(height: 10,),
                      Card(
                        child: QrImage(
                          data: androidQRString,
                          version: QrVersions.auto,
                          size: storyAreaHeight/3,
                          gapless: false,
                        ),
                      ),
                      const SizedBox(height: 40,),
                      Text("苹果手机应用",style: TextStyle(fontSize: 42,color: Colors.white),),
                      const SizedBox(height: 10,),
                      Card(
                        child: QrImage(
                          data: appleQRString,
                          version: QrVersions.auto,
                          size:  storyAreaHeight/3,
                          gapless: false,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0,0,0,20),
            height: 120,
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset("assets/images/1m2_logo.png")
              ],
            ),
          ),
        ],
      ),
    ),verticalWidget: Container(
    height: Get.height,
    width: Get.width, padding: const EdgeInsets.fromLTRB(50,50,50,0),
      decoration: BoxDecoration(
          color: Colors.blue
      ),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("配置设备网络",style: TextStyle(fontSize: 48,color: Colors.white),),
        const SizedBox(height: 50,),
        Container(
          // height: storyAreaVHeight,
          width: storyAreaVWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(Icons.wifi,size: 48,color: Colors.white,),
                  SizedBox(width: 8,),
                  Text("无线网络配置",style: TextStyle(fontSize: 36,color: Colors.white),),
                ],
              ),
              const SizedBox(height: 10,),
              Text("步骤一：扫描右侧手机二维码下载并安装应用，或在手机应用商店搜索「旷云商显」",style: TextStyle(fontSize: 20,color: Colors.white),),
              Text("步骤二：使用手机号码注册并登陆手机应用",style: TextStyle(fontSize: 20,color: Colors.white),),
              Text("步骤三：使用手机主页右上角下拉菜单中的「设备网络」打开设备地址配置页面",style: TextStyle(fontSize: 20,color: Colors.white),),
              Obx((){
                final bleString = homeController.bleString.value;
                return Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text("步骤四：开启手机蓝牙并搜索并连接设备名为",style: TextStyle(fontSize: 20,color: Colors.white),),
                    Text("「$bleString」",style: TextStyle(fontSize: 24,color: Colors.greenAccent),),
                    Text("的设备",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ],
                );
              }),
              Text("步骤五：设置并保存设备无线网络",style: TextStyle(fontSize: 20,color: Colors.white),),
              const SizedBox(height: 50,),
              Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(Icons.cable_outlined,size: 48,color: Colors.white,),
                  SizedBox(width: 8,),
                  Text("配置有线网络",style: TextStyle(fontSize: 36,color: Colors.white),),
                ],
              ),
              const SizedBox(height: 10,),
              Text("通过网线连接设备，设备通过自动获取网络地址访问网络",style: TextStyle(fontSize: 20,color: Colors.white),),
            ],
          ),
        ),
        const SizedBox(height: 30,),
        Container(
          width: storyAreaVWidth,
          child: Obx((){
            final androidQRString = homeController.androidQRStr.value;
            final appleQRString = homeController.iosQRStr.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("安卓手机应用",style: TextStyle(fontSize: 42,color: Colors.white),),
                const SizedBox(height: 10,),
                Card(
                  child: QrImage(
                    data: androidQRString,
                    version: QrVersions.auto,
                    size: storyAreaVWidth/3,
                    gapless: false,
                  ),
                ),
                const SizedBox(height: 40,),
                Text("苹果手机应用",style: TextStyle(fontSize: 42,color: Colors.white),),
                const SizedBox(height: 10,),
                Card(
                  child: QrImage(
                    data: appleQRString,
                    version: QrVersions.auto,
                    size:  storyAreaVWidth/3,
                    gapless: false,
                  ),
                ),
              ],
            );
          }),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.fromLTRB(0,0,0,20),
          height: 120,
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset("assets/images/1m2_logo.png")
            ],
          ),
        ),
      ],
    ),
    ),);
  }
}

