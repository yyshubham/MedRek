import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'QRcodeScan.dart';

class doctor extends StatefulWidget {
  @override
  _doctorState createState() => _doctorState();
}

class _doctorState extends State<doctor> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 0.25, right: 0.25),
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.only(
//                          bottomRight: Radius.circular(25),
//                          bottomLeft: Radius.circular(25),
                        ),
                        color: Color(0xffff577f),
                        shape: BoxShape.rectangle,
                        ),
                  ),
                  Positioned(
                    bottom: -45,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 46,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 45,
                        child: ClipOval(
                          child: Image.network(
                            'https://hips.hearstapps.com/ell.h-cdn.co/assets/17/34/1503503945-syn-elm-1503486795-kristofer-hivju-as-tormund-got-1.jpg',
                            fit: BoxFit.fill,
                            height: 90,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15.0,
                    right: 15.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xffff577f)),
                      ),
                        child: Icon(
                          Icons.qr_code_scanner,
                          size: 35.0,
                          color: Colors.black,
                        ),
                      onPressed :() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QRViewExample()),
                        );
                      }
                    )
                  ),
                ],
                overflow: Overflow.visible,
              ),
              Spacer(flex:1),
              Container(
                margin: EdgeInsets.only(top :60.0),
                child: Center(
                  child :Text(
                    'DOCTOR NAME',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Spacer(flex:2),
              Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10.0, right: 10.0,top: 15.0),
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(
                        Radius.circular(25),
                      ),
                      color: Color(0xffff577f),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(11),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,  // red as border color
                          ),
                          borderRadius:
                          BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 23,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 22,
                        child: Icon(
                          Icons.star,
                          size: 40.0,
                          color: Colors.yellow.shade700,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 23,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 22,
                        child: Icon(
                          Icons.add,
                          size: 45.0,
                          color: Colors.lightBlue.shade700,
                        ),
                      ),
                    ),
                  ),

                ],
                overflow: Overflow.visible,
              ),
              Spacer(flex: 3),
              Container(
                height: 50.0,
//                    width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top:15.0,bottom:5.0,left: 10.0,right:10.0),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.all(
                    Radius.circular(25),
                  ),
                  color: Color(0xffff577f),
                  shape: BoxShape.rectangle,
                ),
                child: Center(
                  child: Text(
                    'BOOK AN APPOINTMENT',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Spacer(flex:3),
              Container(
                height: 50.0,
                margin: EdgeInsets.only(top:10.0,bottom:5.0,left: 10.0,right:10.0),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.all(
                    Radius.circular(25),
                  ),
                  color: Color(0xffff577f),
                  shape: BoxShape.rectangle,
                ),
                child: Center(
                  child: Text(
                    'CONTACT ME',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Spacer(flex:3),
              Container(
                height: 50.0,
                margin: EdgeInsets.only(top:10.0,bottom:10.0,left: 10.0,right:10.0),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.all(
                    Radius.circular(25),
                  ),
                  color: Color(0xffff577f),
                  shape: BoxShape.rectangle,
                ),
                child: Center(
                  child: Text(
                    'MESSAGE ME',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Spacer(flex:15),
            ],
          ),
        ),
      ),
      ),);
  }
}
