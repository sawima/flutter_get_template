import 'package:deviceweb/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:deviceweb/views/widgets/appQR.dart';
import 'package:deviceweb/views/widgets/networkStatus.dart';
import 'package:deviceweb/views/widgets/textTyper.dart';
import 'package:deviceweb/views/widgets/videoInstruction.dart';

import 'components/registerDevice.dart';
import 'connect_network.dart';


class PageRouterPage extends StatefulWidget {
  const PageRouterPage({Key? key}) : super(key: key);

  @override
  _PageRouterPageState createState() => _PageRouterPageState();
}

class _PageRouterPageState extends State<PageRouterPage> {
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          SvgPicture.asset(
            'images/Vanishing-Stripes-3.svg',
            fit: BoxFit.cover,
            width: context.width,
          ),
          Obx((){
            if(!homeController.networkStatus.value){
              return ConnectNetworkPage();
            } else {
              if(homeController.registerMsg.value=="未注册"){
                return RegisterDevicePage();
              } else {
                return Column(children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  NetworkStatus(),
                  TextTyper(),
                  Center(
                    child: InstructionVideo(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  AppQRCode(),
                ]);
              }
            }
          }),
        ]),
      ),
    );
  }
}
