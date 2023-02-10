import 'package:deviceweb/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class InstructionVideo extends StatefulWidget {
  final bool isVertical;
  InstructionVideo({Key? key,required this.isVertical}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _InstructionVideoState();
  }
}

class _InstructionVideoState extends State<InstructionVideo> {
  late VideoPlayerController _videoPlayerController1;
  final HomeController homeController = Get.find();
  bool isVideoInitialized = false;
  @override
  void initState() {
    initializePlayer();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    super.dispose();
  }

  void initializePlayer() {
    _videoPlayerController1 =
        VideoPlayerController.asset('assets/videos/device_demo.mp4');
    _videoPlayerController1.initialize().then((_){
      setState(() {
        isVideoInitialized = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double tvHeight = 100.0;
    double tvWidth = 100.0;
    if(!widget.isVertical){
      tvHeight = (Get.width * 60 /100)*9/16;
      tvWidth = Get.width * 60 /100-12;
    } else {
      tvHeight = (Get.width * 70 /100)*16/9;
      tvWidth = Get.width * 70 /100-12;
    }
    return Container(
      height: tvHeight,
      width: tvWidth,
      decoration: BoxDecoration(
          border: Border.all(
            width: 8,
            color: Colors.black,
          )
      ),
      child:widget.isVertical?Image.asset("assets/images/kimacloud1080x1920.jpeg",fit: BoxFit.fill,):playBlock(),
    );
  }
  Widget playBlock(){
    if(isVideoInitialized){
      _videoPlayerController1.setVolume(0);
      _videoPlayerController1.setLooping(true);
      _videoPlayerController1.play();
      return VideoPlayer(_videoPlayerController1);
    } else{
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xffc7de93),
              ),
            ),
            SizedBox(height: 20),
            Text("加载中",style: TextStyle(color: Colors.white),),
          ]
      );
    }
  }
}

