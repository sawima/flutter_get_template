import 'package:deviceweb/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';

class TextTyper extends StatelessWidget {
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 40.0,
        width: 700.0,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          // child: AnimatedTextKit(
          //   repeatForever: true,
          //   pause: const Duration(milliseconds: 5000),
          //   animatedTexts: [
          //     TypewriterAnimatedText('多种显示屏幕适配，即插即用'),
          //     TypewriterAnimatedText('丰富的应用模版，远程应用推送更新'),
          //     TypewriterAnimatedText('便捷的终端管理软件，支持手机，平板，电脑，网页'),
          //     TypewriterAnimatedText('云端设备监测'),
          //   ],
          //   onTap: () {
          //     print("Tap Event");
          //   },
          // ),
          child: Obx((){
            return AnimatedTextKit(
              repeatForever: true,
              pause: const Duration(milliseconds: 5000),
              // animatedTexts: [
              //   for(var item in homeController.adListStr) TypewriterAnimatedText(item)
              // ],
              animatedTexts: List.generate(homeController.adListStr.length, (index) => TypewriterAnimatedText(homeController.adListStr[index])),
              onTap: () {
                print("Tap Event");
              },
            );
          }),
        ),
      ),
    );
  }
}