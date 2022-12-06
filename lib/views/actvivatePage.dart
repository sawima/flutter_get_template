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
    return DirectionPattern(horizontalWidget: Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.blue
      ),
      child: Stack(
        children: [
          NetworkStatus(),
          Container(
            margin: const EdgeInsets.fromLTRB(300,50,300,50),
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(color: Colors.cyan),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("绑定设备",style: TextStyle(fontSize: 48,color: Colors.white),),
                Card(
                  child: QrImage(
                    data: ",asfasdfasdfsadfas fasdfasdfasfasdfasd fasdfsadfsafsafasd",
                    version: QrVersions.auto,
                    size: Get.width/5,
                    gapless: false,
                  ),
                ),
                const Divider(height: 2,color: Colors.white,),
                Container(
                  width: Get.width,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.purple
                  ),
                  child: Container(
                    // padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    width: 800,
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
                              size: 50,
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
                              size:  50,
                              gapless: false,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.only(top: 400),
          //   height: 200,
          //   width: Get.width,
          //   decoration: BoxDecoration(color: Colors.yellow),
          // ),
          // NetworkStatus(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Builder(builder:(BuildContext context){
          //       print("obx refresh");
          //       final networkInfo = homeController.networkInfo.value;
          //       final networkConnectionStr = homeController.networkConnectionStr.value;
          //       final ethIP = networkInfo.eth0!.ip!;
          //       final wifiIP = networkInfo.wifi!.ip!;
          //       final wifiName = networkInfo.wifi!.name!;
          //       return Container(
          //         height: 300,
          //         width: 300,
          //         decoration: BoxDecoration(
          //             color: Colors.yellow
          //         ),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             Text(networkConnectionStr,style: TextStyle(color: Colors.white),),
          //             Text("有线网络",style: TextStyle(color: Colors.white,fontSize: 16),),
          //             Text(ethIP,style: TextStyle(color: Colors.green,fontSize: 18),),
          //             Text("无线网络($wifiName)",style: TextStyle(color: Colors.white,fontSize: 16),),
          //             Text(wifiIP,style: TextStyle(color: Colors.green,fontSize: 18),),
          //           ],
          //         ),
          //       );
          //     }),
          //   ],
          // ),
          // Positioned(top: 0,right: 0,child: Obx((){
          //   print("obx refresh");
          //   final networkInfo = homeController.networkInfo.value;
          //   final networkConnectionStr = homeController.networkConnectionStr.value;
          //   final ethIP = networkInfo.eth0!.ip!;
          //   final wifiIP = networkInfo.wifi!.ip!;
          //   final wifiName = networkInfo.wifi!.name!;
          //   return Container(
          //     height: 300,
          //     width: 300,
          //     decoration: BoxDecoration(
          //         color: Colors.yellow
          //     ),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Text(networkConnectionStr,style: TextStyle(color: Colors.white),),
          //         Text("有线网络",style: TextStyle(color: Colors.white,fontSize: 16),),
          //         Text(ethIP,style: TextStyle(color: Colors.green,fontSize: 18),),
          //         Text("无线网络($wifiName)",style: TextStyle(color: Colors.white,fontSize: 16),),
          //         Text(wifiIP,style: TextStyle(color: Colors.green,fontSize: 18),),
          //       ],
          //     ),
          //   );
          // })),
        ],
      ),
    ),verticalWidget: Container(
    height: Get.height,
    width: Get.width,
    decoration: BoxDecoration(
    color: Colors.blue
    ),),);
  }
}
