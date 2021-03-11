import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mhack/GenerateQR.dart';
import 'package:mhack/Patienthistory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mhack/constants.dart';
import 'package:mhack/QRcodeScan.dart';
import 'package:mhack/helper.dart';

class doctor1 extends StatefulWidget {
  @override
  _doctor1State createState() => _doctor1State();
}

class _doctor1State extends State<doctor1> {
  String UID;
  getData() async {
    if (doctormap != null) {
      return doctormap;
    }
    Map<String, dynamic> temp;
    print(UID);
    // temp = fire.getPatientData();
    // setState(() {
    //   doctormap = temp;
    // });
    // String UID = FirebaseAuth.instance.currentUser.uid;
    print(UID);
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('patient').doc(UID).get();
    temp = documentSnapshot.data();
    setState(() {
      doctormap = temp;
    });
    return doctormap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/back2.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  height: 130,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
                      // child: Text(
                      //   doctormap['name'],
                      //   style: TextStyle(
                      //       fontSize: 20, fontWeight: FontWeight.bold),
                      // ),
                      child: Text(''),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  right: 20,
                  child: FutureBuilder(
                      future: getData(),
                      builder: (context, AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.data == null) {
                          return Center(
                            child: Transform.scale(
                              scale: 0.3,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xffff416c)),
                              ),
                            ),
                          );
                        }

                        return Text(
                          doctormap['name'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        );
                      }),
                ),
                Positioned(
                  left: 30,
                  bottom: -30,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(doctormap['imageURL'] != null
                              ? doctormap['imageURL']
                              : 'https://image.shutterstock.com/image-vector/doctor-vector-illustration-260nw-512904655.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue.shade300),
                      ),
                      child: Icon(
                        Icons.qr_code_scanner,
                        size: 35.0,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => helper()),
                        );
                      }),
                ),
              ],
              overflow: Overflow.visible,
            ),
            Spacer(
              flex: 3,
            ),
            FutureBuilder(
                future: getData(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: Transform.scale(
                        scale: 0.3,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xffff416c)),
                        ),
                      ),
                    );
                  }
                  return Data(first: 'Name', second: doctormap['name']);
                }),
            Spacer(
              flex: 1,
            ),
            FutureBuilder(
                future: getData(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: Transform.scale(
                        scale: 0.3,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xffff416c)),
                        ),
                      ),
                    );
                  }
                  return Data(first: 'E-Mail', second: doctormap['email']);
                }),
            Spacer(
              flex: 1,
            ),
            FutureBuilder(
                future: getData(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: Transform.scale(
                        scale: 0.3,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xffff416c)),
                        ),
                      ),
                    );
                  }
                  return Data(first: 'Mobile', second: doctormap['mobile']);
                }),
            Spacer(
              flex: 1,
            ),
            FutureBuilder(
                future: getData(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: Transform.scale(
                        scale: 0.3,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xffff416c)),
                        ),
                      ),
                    );
                  }
                  return Data(
                      first: 'specialisation',
                      second: doctormap['specialization']);
                }),
            Spacer(
              flex: 1,
            ),
            FutureBuilder(
                future: getData(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: Transform.scale(
                        scale: 0.3,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xffff416c)),
                        ),
                      ),
                    );
                  }
                  return Data(
                      first: 'qualification',
                      second: doctormap['qualification']);
                }),
            Spacer(
              flex: 1,
            ),
            FutureBuilder(
                future: getData(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: Transform.scale(
                        scale: 0.3,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xffff416c)),
                        ),
                      ),
                    );
                  }
                  return Data(first: 'Hospital', second: doctormap['hospital']);
                }),
            Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class Data extends StatelessWidget {
  Data({@required this.first, @required this.second});
  var first;
  var second;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
      decoration: BoxDecoration(
        color: Color(0xff64B4AF),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            offset: Offset(4.0, 4.0),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.grey[100],
            offset: Offset(-4.0, -4.0),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
//        shape: BoxShape.rectangle,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
        margin: EdgeInsets.only(left: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
          shape: BoxShape.rectangle,
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: AutoSizeText(
                '$first',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
                minFontSize: 10,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                softWrap: false,
              ),
            ),
            Expanded(
              flex: 1,
              child: AutoSizeText(
                '$second',
                style: GoogleFonts.montserrat(
                  fontSize: 14.0,
                ),
                minFontSize: 10,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                softWrap: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
