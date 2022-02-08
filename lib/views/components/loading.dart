import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset('assets/lottie/loading-bubbles.json')),
    );
  }
}
