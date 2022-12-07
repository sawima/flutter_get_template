import 'package:deviceweb/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class InstructionVideo extends StatefulWidget {
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
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    super.dispose();
  }

  void initializePlayer() {
    _videoPlayerController1 =
        VideoPlayerController.asset('assets/videos/device_demo.mp4');
    // _videoPlayerController1 =
    //     VideoPlayerController.network('https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4');

    _videoPlayerController1.initialize().then((_){
      print('initialized listener: $_videoPlayerController1');
      print(_videoPlayerController1.value.isInitialized);
      print('initialized listener finished: $_videoPlayerController1');
      setState(() {
        isVideoInitialized = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (context.width * 60 /100)*9/16,
      width: context.width * 60 /100-12,
      decoration: BoxDecoration(
          border: Border.all(
            width: 8,
            color: Colors.black,
          )
      ),
      child:playBlock(),
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

