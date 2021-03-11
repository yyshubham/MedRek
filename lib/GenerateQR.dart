import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:mhack/constants.dart';

import 'package:flutter_share_file/flutter_share_file.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class GenerateQR extends StatefulWidget {
  @override
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: QrImage(
                data: map['UID'],
                version: QrVersions.auto,
                size: 250,
                gapless: false,
              ),
            ),
          ),
          RaisedButton(
            onPressed: () async {
              Directory dir = await getApplicationDocumentsDirectory();
              File testFile = new File("${dir.path}/image.jpg");
              FlutterShareFile.share(
                  dir.path, "image.jpg", ShareFileType.image);
            },
            child: new Text("share image"),
          ),
        ],
      ),
    );
  }
}
