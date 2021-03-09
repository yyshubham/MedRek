import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mhack/AddTask.dart';
import 'package:mhack/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class recordsScreen extends StatefulWidget {
  String UID;
  recordsScreen(this.UID);
  @override
  recordsScreenState createState() => recordsScreenState();
}

// final List<String> date = <String>['7/03/21-14/03/21'];
// final List<String> disease = <String>['Corona'];
// final List<String> doctor = <String>['JK Singh'];
// final List<String> hospital = <String>['JK Hospital'];
// final List<String> medicine = <String>['Paracetamol'];

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
              body: Container(
                child: Column(
                  children: [
                    // Expanded(flex: 1),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          TextButton(
                              child: Icon(
                                Icons.add,
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
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 10),
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text("Treatment Time : "),
                                            Text((data[index])['start']),
                                            Text("  to  "),
                                            Text((data[index])['end']),
                                          ],
                                        ),
                                        Row(children: [
                                          Text("Disease : "),
                                          Text((data[index])['disease'])
                                        ]),
                                        Row(children: [
                                          Text("Medicines : "),
                                          Text((data[index])['medicine'])
                                        ]),
                                        Row(children: [
                                          Text("Treated by : "),
                                          Text((data[index])['doctor'])
                                        ]),
                                        Row(children: [
                                          Text("Clinic/Hospital Name : "),
                                          Text((data[index])['hospital'])
                                        ]),
                                      ],
                                    ),
                                  ),
                                );

                                // return Container(
                                //   decoration: BoxDecoration(
                                //     color: Color(0xffC0DDEE),
                                //     borderRadius:
                                //         BorderRadius.all(Radius.circular(20)),
                                //     boxShadow: [
                                //       BoxShadow(
                                //         color: Colors.grey[300],
                                //         offset: Offset(4.0, 4.0),
                                //         blurRadius: 4.0,
                                //         spreadRadius: 1.0,
                                //       ),
                                //       BoxShadow(
                                //         color: Colors.grey[100],
                                //         offset: Offset(-4.0, -4.0),
                                //         blurRadius: 10.0,
                                //         spreadRadius: 1.0,
                                //       ),
                                //     ],
                                //   ),
                                //   child: Column(
                                //     children: [
                                //       Row(
                                //         mainAxisAlignment: MainAxisAlignment.center,
                                //         children: [
                                //           Text(startdate[index] + ' - '),
                                //           Text(enddate[index]),
                                //         ],
                                //       ),
                                //       Text(disease[index]),
                                //       Text(doctor[index]),
                                //       Text(hospital[index]),
                                //       Text(medicine[index]),
                                //       SizedBox(
                                //         height: 10,
                                //       ),
                                //     ],
                                //   ),
                                // );
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
                  ],
                ),
              ),
            ),
          );
  }
}
