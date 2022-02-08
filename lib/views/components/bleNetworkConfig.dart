import 'package:flutter/material.dart';
class BleNetworkConfigPage extends StatefulWidget {
  const BleNetworkConfigPage({Key? key}) : super(key: key);

  @override
  _BleNetworkConfigPageState createState() => _BleNetworkConfigPageState();
}

class _BleNetworkConfigPageState extends State<BleNetworkConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Ble Network connection"),
    );
  }
}
