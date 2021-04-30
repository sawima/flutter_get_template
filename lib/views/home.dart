import '../controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: 200,
              maxWidth: 200,
            ),
            child: Card(
              child: QrImage(
                data: 'This is a simple QR code',
                version: QrVersions.auto,
                size: 100,
                gapless: false,
              ),
            ),
          ),
          Obx(() => Text("${homeController.stateStr}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green),)),
          TextButton(onPressed: ()=> homeController.changeStr(), child: Icon(Icons.ac_unit)),
        ]
      ),
    );
  }
}
