import 'package:deviceweb/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkStatus extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Row(
        children: [
          Spacer(),
          Obx((){
            if(homeController.networkStatus.value){
              return Text(
                homeController.networkConnectionStr.value,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white),
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
