import 'package:deviceweb/utils/direction.dart';
import 'package:deviceweb/views/widgets/appQR.dart';
import 'package:deviceweb/views/widgets/networkStatus.dart';
import 'package:deviceweb/views/widgets/textTyper.dart';
import 'package:deviceweb/views/widgets/videoInstruction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceInfoPage extends StatefulWidget {
  const DeviceInfoPage({Key? key}) : super(key: key);

  @override
  State<DeviceInfoPage> createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  @override
  Widget build(BuildContext context) {
    return DirectionPattern(horizontalWidget: Container(
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              color: Colors.blue
          ),
          child: Stack(children: [
            NetworkStatus(),
            Container(
              margin: const EdgeInsets.only(top: 90),
              child: Column(children: [
                TextTyper(),
                Center(
                  child: InstructionVideo(isVertical: false,),
                ),
                SizedBox(
                  height: 10.0,
                ),
                AppQRCode(),
              ]),
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
          ]),
        ),
      ),
    ), verticalWidget: Container(
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              color: Colors.blue
          ),
          child: Stack(children: [
            NetworkStatus(),
            Container(
              margin: const EdgeInsets.only(top: 160),
              child: Column(children: [
                TextTyper(),
                Center(
                  child: InstructionVideo(isVertical: true,),
                ),
                SizedBox(
                  height: 60.0,
                ),
                AppQRCode(),
              ]),
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
          ]),
        ),
      ),
    ),);
  }
}
