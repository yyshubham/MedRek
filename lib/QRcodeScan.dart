import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:mhack/patientportfolio.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'package:mhack/constants.dart';
import 'package:flutter/cupertino.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => QRViewExampleState();
}

class QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),

          ),
          Expanded(
            flex: 1,
            child: Center(
    //           child: (result != null)
    //               ? TextButton(onPressed:(){Navigator.push(context,
    // CupertinoPageRoute(builder: (context) => PatientPortfolio(result.toString())));
    // }, child: Text('Press me to view patient history')) : Text('Incorrect QRcode');
              child : (result!=null) ? TextButton(onPressed: () {
                CupertinoPageRoute(builder:(context) => PatientPortfolio(result.toString()));
              } , child: Text(
                'Press Me',
              ),) :
              Text(
                'Incorrect QRCode',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
