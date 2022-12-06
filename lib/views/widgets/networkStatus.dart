import 'package:deviceweb/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkStatus extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      // decoration: BoxDecoration(
      //   color: Colors.yellow
      // ),
      padding: EdgeInsets.only(left:8,right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx((){
            return Text(
              homeController.registerMsg.value,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white),
            );
          }),
          Spacer(),
          Obx((){
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(padding: EdgeInsets.only(right: 10),child: Text(homeController.networkConnectionStr.value,style: TextStyle(color: Colors.white,fontSize: 24),)),
                    ],
                  ),
                  SizedBox(height: 5,),
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
                  ),
                ],
              );
          }),
          // Obx(() => Text(
          //   homeController.networkConnectionStr.value,
          //   style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 18.0,
          //       color: Colors.white),
          // )),
        ],
      ),
    );
  }
}


// class NetworkStatus extends StatefulWidget {
//
//   @override
//   _NetworkStatusState createState() => _NetworkStatusState();
// }
//
// class _NetworkStatusState extends State<NetworkStatus> {
//   HomeController homeController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(right: 20),
//       child: Row(
//         children: [
//           Spacer(),
//           Obx(() => Text(
//             homeController.networkConnectionStr.value,
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18.0,
//                 color: Colors.white),
//           )),
//           // networkStatus == true
//           //     ? Text(
//           //         networkConnectionStr,
//           //         style: TextStyle(
//           //             fontWeight: FontWeight.bold,
//           //             fontSize: 18.0,
//           //             color: Colors.white),
//           //       )
//           //     : Text(
//           //         networkConnectionStr,
//           //         style: TextStyle(
//           //             fontWeight: FontWeight.bold,
//           //             fontSize: 18.0,
//           //             color: Colors.red),
//           //       ),
//           // Text("网络连接状态",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.white),),
//         ],
//       ),
//     );
//   }
// }
