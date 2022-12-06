import 'package:deviceweb/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkStatus extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:30,right: 30),
      child: Row(
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
            if(homeController.networkStatus.value){
              print("homeController.networkInfo.value.toJson()");
              print(homeController.networkInfo.value.toJson());
              // return Column(
              //     children: [
              //       Text(
              //         homeController.networkConnectionStr.value,
              //         style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 18.0,
              //             color: Colors.white),
              //       ),
              //       Text(
              //         homeController.networkInfo.value.eth0!.ip!,
              //         style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 12.0,
              //             color: Colors.green),
              //       ),
              //       Text(
              //         homeController.networkInfo.value.wifi!.ip!,
              //         style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 12.0,
              //             color: Colors.green),
              //       ),
              //       // Text(
              //       //   homeController.ipAddress.value,
              //       //   style: TextStyle(
              //       //       fontWeight: FontWeight.bold,
              //       //       fontSize: 12.0,
              //       //       color: Colors.green),
              //       // ),
              //       // Text(
              //       //   homeController.clientID.value,
              //       //   style: TextStyle(
              //       //       fontWeight: FontWeight.bold,
              //       //       fontSize: 12.0,
              //       //       color: Colors.green),
              //       // ),
              //     ]
              // );
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
                ],
              );

            } else {
              return Text(
                homeController.networkConnectionStr.value,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.red),
              );
            }
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
