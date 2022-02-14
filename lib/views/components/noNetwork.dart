import 'package:deviceweb/controllers/homeController.dart';
import 'package:deviceweb/views/components/qrImageBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deviceweb/utils/direction.dart';

class NoNetworkPage extends StatefulWidget {
  const NoNetworkPage({Key? key}) : super(key: key);

  @override
  _NoNetworkPageState createState() => _NoNetworkPageState();
}

class _NoNetworkPageState extends State<NoNetworkPage> {
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: DirectionPattern(
          horizontalWidget: Container(
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg1.png"),
                  fit: BoxFit.cover,
                )
            ),
            constraints: BoxConstraints(
              minHeight: Get.height
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("初始化配置设备",style: TextStyle(color: Colors.white,fontSize: 80),),
                        Text("配置步骤",style: TextStyle(color: Colors.white,fontSize: 50),),
                        Padding(padding: EdgeInsets.only(left: 30,top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("1. 通过网线连接设备至网络",style: TextStyle(color: Colors.white,fontSize: 32),),
                              Text("2. 扫描右侧二维码下载安装手机应用",style: TextStyle(color: Colors.white,fontSize: 32),),
                              Text("3. 使用手机应用扫描右侧绑定二维码绑定设备",style: TextStyle(color: Colors.white,fontSize: 32),),
                              Text("4. 使用手机应用配置屏幕分辨率和显示方向",style: TextStyle(color: Colors.white,fontSize: 32),),
                              Text("5. 如需配置无线网络，请使用手机应用扫描右侧无线配置二维码",style: TextStyle(color: Colors.white,fontSize: 32),),
                            ],
                          ),
                        ),
                        // Expanded(child:SizedBox()),
                        SizedBox(height: 10,),
                        Padding(padding: EdgeInsets.only(bottom: 10),child: Text("网页管理地址：https://c.1m2.fun",style: TextStyle(fontSize: 28,color: Colors.white),),),
                      ],
                    ),
                  ),
                  Expanded(
                    flex:3,
                    child: Obx((){
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(padding: EdgeInsets.only(right: 10),child: Text(homeController.networkConnectionStr.value,style: TextStyle(color: Colors.white,fontSize: 24),)),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("有线网络",style: TextStyle(color: Colors.white,fontSize: 16),),
                                        Text(homeController.networkInfo.value.eth0!.ip!,style: TextStyle(color: Colors.green,fontSize: 18),),
                                        Text("无线网络(${homeController.networkInfo.value.wifi!.name!})",style: TextStyle(color: Colors.white,fontSize: 16),),
                                        Text(homeController.networkInfo.value.wifi!.ip!,style: TextStyle(color: Colors.green,fontSize: 18),),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 40,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("手机应用下载",style: TextStyle(color: Colors.white,fontSize: 30),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  QRImageWidget(statementStr: "安卓应用",qrStr: homeController.androidQRStr.value,),
                                  SizedBox(width: 40,),
                                  QRImageWidget(statementStr: "苹果应用",qrStr: homeController.iosQRStr.value,),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("设备管理",style: TextStyle(color: Colors.white,fontSize: 30),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  QRImageWidget(statementStr: "绑定设备",qrStr: homeController.activateQRStr.value,),
                                  SizedBox(width: 40,),
                                  QRImageWidget(statementStr: "设置无线网络",qrStr: homeController.wifiConfigStr.value,),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 50,),
                        ],
                      );
                    })
                  ),
                ],
              ),
            ),
          ),
          verticalWidget: Container(
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg12.png"),
                  fit: BoxFit.cover,
                )
            ),
            constraints: BoxConstraints(
              minHeight: Get.height
            ),
            child: Obx((){
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("初始化配置设备",style: TextStyle(color: Colors.white,fontSize: 60),),
                        Text("配置步骤",style: TextStyle(color: Colors.white,fontSize: 40),),
                        Padding(padding: EdgeInsets.only(left: 30,top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("1. 通过网线连接设备至网络",style: TextStyle(color: Colors.white,fontSize: 28),),
                              Text("2. 扫描右侧二维码下载安装手机应用",style: TextStyle(color: Colors.white,fontSize: 28),),
                              Text("3. 使用手机应用扫描右侧绑定二维码绑定设备",style: TextStyle(color: Colors.white,fontSize: 28),),
                              Text("4. 使用手机应用配置屏幕分辨率和显示方向",style: TextStyle(color: Colors.white,fontSize: 28),),
                              Text("5. 如需配置无线网络，请使用手机应用扫描右侧无线配置二维码",style: TextStyle(color: Colors.white,fontSize: 28),),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(padding: EdgeInsets.only(bottom: 10),child: Text("网页管理地址：https://c.1m2.fun",style: TextStyle(fontSize: 28,color: Colors.white),),),
                        SizedBox(height: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("手机应用下载",style: TextStyle(color: Colors.white,fontSize: 30),),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                QRImageWidget(statementStr: "安卓应用",qrStr: homeController.androidQRStr.value,),
                                SizedBox(width: 40,),
                                QRImageWidget(statementStr: "苹果应用",qrStr: homeController.iosQRStr.value,),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("设备管理",style: TextStyle(color: Colors.white,fontSize: 30),),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                QRImageWidget(statementStr: "绑定设备",qrStr: homeController.activateQRStr.value,),
                                SizedBox(width: 40,),
                                QRImageWidget(statementStr: "设置无线网络",qrStr: homeController.wifiConfigStr.value,),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment:MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Padding(padding: EdgeInsets.only(right: 5),child: Text(homeController.networkConnectionStr.value,style: TextStyle(color: Colors.white,fontSize: 18),)),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("有线网络",style: TextStyle(color: Colors.white,fontSize: 14),),
                                        Text(homeController.networkInfo.value.eth0!.ip!,style: TextStyle(color: Colors.green,fontSize: 18),),
                                        Text("无线网络(${homeController.networkInfo.value.wifi!.name!})",style: TextStyle(color: Colors.white,fontSize: 14),),
                                        Text(homeController.networkInfo.value.wifi!.ip!,style: TextStyle(color: Colors.green,fontSize: 18),),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
