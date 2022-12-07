import 'package:deviceweb/views/components/loading.dart';
import '../controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'actvivatePage.dart';

import 'connect_network.dart';
import 'device_info.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(height: 100,width: 100,color: Colors.yellow,),
      body: Obx((){
        if(homeController.loadingStatus.value){
          if(homeController.networkStatus.value){
            if(homeController.registerStatus.value){
              return DeviceInfoPage();
            } else {
              return ActivatePage();
            }
          } else {
            return ConnectNetworkPage();
          }
        } else {
          return LoadingPage();
        }
      })
    );
  }
}
