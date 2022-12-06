// import 'package:video_player/video_player.dart';

// import 'package:deviceweb/views/widgets/video.dart';
// import 'package:deviceweb/views/widgets/videoInstruction.dart';
import 'package:deviceweb/views/components/loading.dart';
import 'package:deviceweb/views/components/noNetwork.dart';
// import 'package:deviceweb/views/components/scrollPage.dart';
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

import 'connect_network.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';


// import 'package:video_player_web/video_player_web.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Scaffold(
      body: Obx((){
        if(homeController.loadingStatus.value){
          if(!homeController.networkStatus.value){
            return SingleChildScrollView(
              child: Stack(children: [
                SvgPicture.asset(
                  'images/Vanishing-Stripes-3.svg',
                  fit: BoxFit.cover,
                  width: context.width,
                ),
                NetworkStatus(),
                Column(children: [
                  SizedBox(
                    height: 60.0,
                  ),
                  TextTyper(),
                  Center(
                    child: InstructionVideo(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  AppQRCode(),
                ]),
              ]),
            );
          } else {
            // return NoNetworkPage();
            return ConnectNetworkPage();
          }
        } else {
          return LoadingPage();
        }
      })
    );
  }
}
