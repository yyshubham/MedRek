import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'firebase/firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mhack/firebase/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mhack/GenerateQR.dart';
import 'package:mhack/Patienthistory.dart';
import 'package:mhack/constants.dart';

class PatientPortfolio extends StatefulWidget {
  @override
  String UID;
  PatientPortfolio(String id) {
    this.UID = id;
  }
  _PatientPortfolioState createState() => _PatientPortfolioState(UID);
}

class _PatientPortfolioState extends State<PatientPortfolio> {
  _PatientPortfolioState(String id) {
    this.UID = id;
  }

  String str;
  String UID;
  String generate() {
    for (int i = 0; i < 8; i++) {
      str += (map[i].first + ":" + map[i].second + ",");
    }
    return str;
  }

  getData() async {
    if (map != null) {
      return map;
    }
    Map<String, dynamic> temp;
    print(UID);
    // temp = fire.getPatientData();
    // setState(() {
    //   map = temp;
    // });
    // String UID = FirebaseAuth.instance.currentUser.uid;
    print(UID);
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('patient').doc(UID).get();
    temp = documentSnapshot.data();
    setState(() {
      map = temp;
    });
    return map;
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        //   map['name'],
                        //   style: TextStyle(
                        //       fontSize: 20, fontWeight: FontWeight.bold),
                        // ),
                        child: Text(''),
                      ),
                    ),
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
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xffff416c)),
                              ),
                            ),
                          );
                        }

                        return Positioned(
                          bottom: -40,
                          right: 20,
                          child: Text(
                            map['name'],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        );
                      }),
                  Positioned(
                    left: 20,
                    bottom: -50,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(map['imageURL']),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: GenerateQR(),
                                  ),
                                ));
                      },
                      child: Icon(
                        Icons.qr_code_scanner,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
                overflow: Overflow.visible,
              ),
              SizedBox(
                height: 65,
              ),
              // FutureBuilder(
              //     future: getData(),
              //     builder: (context, AsyncSnapshot<dynamic> snapshot) {
              //       if (snapshot.data == null) {
              //         return Center(
              //           child: Transform.scale(
              //             scale: 0.3,
              //             child: CircularProgressIndicator(
              //               backgroundColor: Colors.white,
              //               valueColor: AlwaysStoppedAnimation<Color>(
              //                   Color(0xffff416c)),
              //             ),
              //           ),
              //         );
              //       }
              //       return Data(first: 'Name', second: map['name']);
              //     }),
              FutureBuilder(
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
                    return Data(first: 'E-Mail', second: map['email']);
                  }),
              FutureBuilder(
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
                    return Data(first: 'Mobile', second: map['mobile']);
                  }),
              FutureBuilder(
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
                    return Data(first: 'Gender', second: map['gender']);
                  }),
              FutureBuilder(
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
                    return Data(first: 'Age', second: map['age']);
                  }),
              FutureBuilder(
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
                    return Data(
                        first: 'Blood Group', second: map['bloodGroup']);
                  }),
              FutureBuilder(
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
                    return Data(first: 'Profession', second: map['profession']);
                  }),
              SizedBox(
                height: 10,
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              FlatButton(
                  child: Text(
                    'MEDICAL RECORD',
                    style: TextStyle(
                        color: Color(0xff64B4AF),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  minWidth: double.infinity,
                  height: 15,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (Context) {
                        return recordsScreen(UID);
                      }),
                    );
                  }),
              SizedBox(
                height: 10,
                child: Divider(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
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
      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
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
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 10.0, 15.0),
        margin: EdgeInsets.only(
          left: 15.0,
        ),
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
                maxLines: 3,
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
