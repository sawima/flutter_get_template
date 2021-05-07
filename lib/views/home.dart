// import 'package:video_player/video_player.dart';

// import 'package:deviceweb/views/widgets/video.dart';
// import 'package:deviceweb/views/widgets/videoInstruction.dart';
import 'package:deviceweb/views/widgets/appQR.dart';
import 'package:deviceweb/views/widgets/networkStatus.dart';
import 'package:deviceweb/views/widgets/textTyper.dart';
// import 'package:deviceweb/views/widgets/otherVideo.dart';
import 'package:deviceweb/views/widgets/videoInstruction.dart';

import '../controllers/homeController.dart';
import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import 'package:video_player_web/video_player_web.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Get.put(HomeController());
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
          Column(children: [
            NetworkStatus(),
            SizedBox(
              height: 10.0,
            ),
            TextTyper(),
            // SizedBox(
            //   height: 10.0,
            // ),
            Center(
              child: InstructionVideo(),
            ),
            SizedBox(
              height: 30.0,
            ),
            AppQRCode(),
            // Obx(() => Text(
            //       "${homeController.stateStr}",
            //       style: TextStyle(
            //           fontSize: 30,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.green),
            //     )),
            // TextButton(
            //     onPressed: () => homeController.changeStr(),
            //     child: Icon(Icons.ac_unit)),
          ]),
        ]),
      ),
    );
  }
}