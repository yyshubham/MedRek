import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'QRcodeScan.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:image_picker/image_picker.dart';

class helper extends StatefulWidget {
  @override
  _helperState createState() => _helperState();
}

class _helperState extends State<helper> {

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage(
                'assets/images/back.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.only(left:50,right:50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                decoration: new BoxDecoration(
                  color: Color(0xff64B4AF),
                  border: Border.all(
                    width: 2,
                    color: Colors.black87, // red as border color
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 25.0, // soften the shadow
                      spreadRadius: 4.0, //extend the shadow
                      offset: Offset(
                        5.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => QRViewExample()));
                    },
                    child: Text(
                      'Scan a QR code :)',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                decoration: new BoxDecoration(
                  color: Color(0xff64B4AF),
                  border: Border.all(
                    width: 2,
                    color: Colors.black, // red as border color
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 25.0, // soften the shadow
                      spreadRadius: 4.0, //extend the shadow
                      offset: Offset(
                        5.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      // Navigator.push(
                      //     context,
                      //     CupertinoPageRoute(
                      //         builder: (context) => QRViewExample()));
                      await getImage();
                    },
                    child: Text(
                      'Upload from Device',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

