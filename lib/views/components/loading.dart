import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/homeController.dart';
import 'package:get/get.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final HomeController homeController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    homeController.checkRegisterStatus();
    homeController.getActivateQRStr();
    homeController.getAppQRStr();
    homeController.getBleName();
    homeController.updateNetworkStatus();
    homeController.getLocalIPAddress();
    Future.delayed(const Duration(seconds: 6),(){
      homeController.loadingStatus.value = true;});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset('assets/lottie/ai-brain.json')),
    );
  }
}
