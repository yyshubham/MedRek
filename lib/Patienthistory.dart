import 'package:flutter/material.dart';
import 'package:mhack/AddTask.dart';
import 'package:mhack/constants.dart';

class recordsScreen extends StatefulWidget {
  @override
  recordsScreenState createState() => recordsScreenState();
}

// final List<String> date = <String>['7/03/21-14/03/21'];
// final List<String> disease = <String>['Corona'];
// final List<String> doctor = <String>['JK Singh'];
// final List<String> hospital = <String>['JK Hospital'];
// final List<String> medicine = <String>['Paracetamol'];

class recordsScreenState extends State<recordsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                                    child: AddTaskScreen(),
                                  )));
                        }),
                    ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: startdate.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Color(0xffC0DDEE),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
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
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(startdate[index] + ' - '),
                                    Text(enddate[index]),
                                  ],
                                ),
                                Text(disease[index]),
                                Text(doctor[index]),
                                Text(hospital[index]),
                                Text(medicine[index]),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
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
            ],
          ),
        ),
      ),
    );
  }
}
