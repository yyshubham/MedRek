import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mhack/AddTask.dart';
import 'package:mhack/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class recordsScreen extends StatefulWidget {
  String UID;
  recordsScreen(this.UID);
  @override
  recordsScreenState createState() => recordsScreenState();
}

class recordsScreenState extends State<recordsScreen> {
  List<QueryDocumentSnapshot> data = [];

  getData() async {
    CollectionReference medicalHistory = FirebaseFirestore.instance
        .collection('patient')
        .doc(widget.UID)
        .collection('history');
    List<QueryDocumentSnapshot> list;
    await medicalHistory.snapshots().forEach((element) {
      list = element.docs;
      // for (int i = 0; i < list.length; i++) print(list[i].data());
      setState(() {
        data = list;
      });
    });
  }

  @override
  void initState() {
    getData();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return data == null
        ? Center(child: CircularProgressIndicator())
        : SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    TextButton(
                        child: Icon(
                          Icons.add,
                          color: Color(0xff64B4AF),
                          size: 25,
                        ),
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
                                    child: AddTaskScreen(
                                        data.length + 1, widget.UID),
                                  )));
                        }),
                    ListView.builder(
                        padding: const EdgeInsets.all(8),
                        // itemCount: startdate.length,
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(20)),

                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color(0xff64B4AF),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Color(0xff64B4AF),
                              //     // offset: Offset(4.0, 4.0),
                              //     blurRadius: 0.0,
                              //     spreadRadius: 6.0,
                              //   ),
                              //   // BoxShadow(
                              //   //   color: Color(0xff64B4AF),
                              //   //   offset: Offset(-4.0, -4.0),
                              //   //   blurRadius: 0.0,
                              //   //   spreadRadius: 3.0,
                              //   // ),
                              // ],
                            ),
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                              child: Column(
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Text("Disease : "),
                                        Text(
                                          (data[index])['disease'],
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Icon(
                                          Icons.edit,
                                          size: 17,
                                        ),
                                      ]),
                                  Text("Treatment Time"),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        (data[index])['start'],
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "  to  ",
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        (data[index])['end'],
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(children: [
                                    Text("Medicines : "),
                                    Text(
                                      (data[index])['medicine'],
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),
                                  Row(children: [
                                    Text("Treated by : "),
                                    Text(
                                      (data[index])['doctor'],
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),
                                  Row(children: [
                                    Text("Clinic/Hospital Name : "),
                                    Text(
                                      (data[index])['hospital'],
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),
                                ],
                              ),
                            ),
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
