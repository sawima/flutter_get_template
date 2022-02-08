import 'package:deviceweb/views/components/qrImageBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ScrollPage extends StatelessWidget {
  const ScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Container(
              // height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg1.png"),
                    fit: BoxFit.cover,
                  )
              ),
              constraints: BoxConstraints(
                minHeight: Get.height
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("初始化配置设备",style: TextStyle(color: Colors.white,fontSize: 80),),
                          Text("配置步骤",style: TextStyle(color: Colors.white,fontSize: 50),),
                          Padding(padding: EdgeInsets.only(left: 30,top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("1. 通过网线连接设备至网络",style: TextStyle(color: Colors.white,fontSize: 32),),
                                Text("2. 扫描右侧二维码下载安装手机应用",style: TextStyle(color: Colors.white,fontSize: 32),),
                                Text("3. 使用手机应用扫描右侧绑定二维码绑定设备",style: TextStyle(color: Colors.white,fontSize: 32),),
                                Text("4. 使用手机应用配置屏幕分辨率和显示方向",style: TextStyle(color: Colors.white,fontSize: 32),),
                                Text("5. 如需配置无线网络，请使用手机应用扫描右侧无线配置二维码",style: TextStyle(color: Colors.white,fontSize: 32),),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 10),child: Text("网页管理地址：https://c.1m2.fun",style: TextStyle(fontSize: 28,color: Colors.white),),),
                        ],
                      ),
                    ),
                    Expanded(
                      flex:3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(padding: EdgeInsets.only(right: 10),child: Text("网络连接状态",style: TextStyle(color: Colors.white,fontSize: 24),)),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("有线网络",style: TextStyle(color: Colors.white,fontSize: 16),),
                                        Text("192.168.1.12",style: TextStyle(color: Colors.green,fontSize: 18),),
                                        Text("无线网络(MyHomeWifi)",style: TextStyle(color: Colors.white,fontSize: 16),),
                                        Text("192.168.1.12",style: TextStyle(color: Colors.green,fontSize: 18),),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          // Expanded(child: SizedBox(),),
                          SizedBox(height: 40,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("手机应用下载",style: TextStyle(color: Colors.white,fontSize: 30),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  QRImageWidget(statementStr: "Android App",qrStr: "https://android.com",),
                                  SizedBox(width: 40,),
                                  QRImageWidget(statementStr: "Android App",qrStr: "https://android.com",),
                                ],
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("手机应用下载",style: TextStyle(color: Colors.white,fontSize: 30),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  QRImageWidget(statementStr: "Android App",qrStr: "https://android.com",),
                                  SizedBox(width: 40,),
                                  QRImageWidget(statementStr: "Android App",qrStr: "https://android.com",),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 50,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1500,
              width: Get.width,
              color: Colors.yellow,
              child: Center(
                child: Text("xxx"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
