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
  @override
  void initState() {
    super.initState();
    initializePlayer();
    ever(homeController.instructionVideoUrl, (_){
      initializePlayer();
    });
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    print("video url");
    print(homeController.instructionVideoType.value);
    if(homeController.instructionVideoType.value == "remote") {
      _videoPlayerController1 =
          VideoPlayerController.network(homeController.instructionVideoUrl.value);
    } else {
      _videoPlayerController1 =
          VideoPlayerController.asset('assets/videos/video.mp4');
    }
    await _videoPlayerController1.initialize();
    _videoPlayerController1.play();
    _videoPlayerController1.setLooping(true);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 60 /100,
      width: context.width * 60 /100,
      child:_videoPlayerController1.value.isInitialized
        ? VideoPlayer(_videoPlayerController1)
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Loading!!!!!'),
          ]
        ),
    );
    // return Column(
    //   children: <Widget>[
    //     Expanded(
    //       child: Center(
    //         child:_videoPlayerController1.value.isInitialized
    //             ? VideoPlayer(_videoPlayerController1)
    //             : Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: const [
    //                 CircularProgressIndicator(),
    //                 SizedBox(height: 20),
    //                 Text('Loading!!!!!'),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
