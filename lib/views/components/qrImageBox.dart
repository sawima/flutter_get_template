import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRImageWidget extends StatelessWidget {
  final String statementStr;
  final String qrStr;
  const QRImageWidget({Key? key,required this.statementStr,required this.qrStr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: 200,
            maxWidth: 200,
          ),
          child: Card(
            child: QrImage(
              data: qrStr,
              version: QrVersions.auto,
              size: 120,
              gapless: false,
            ),
          ),
        ),
        Text(statementStr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.0,color: Colors.white),),
      ],
    );
  }
}
