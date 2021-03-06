import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mhack/firebase/firestore.dart';
import 'package:mhack/patientportfolio.dart';
import 'package:mhack/screens/patient_profile_input.dart';
import 'package:provider/provider.dart';
import 'package:mhack/Patienthistory.dart';
import 'package:mhack/constants.dart';

class AddTaskScreen extends StatefulWidget {
  int size;
  String UID;
  AddTaskScreen(this.size, this.UID);
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController startdateController = TextEditingController();
  TextEditingController enddateController = TextEditingController();
  TextEditingController diseaseController = TextEditingController();
  TextEditingController doctorController = TextEditingController();
  TextEditingController hospitalController = TextEditingController();
  TextEditingController medicineController = TextEditingController();
  TextEditingController testscontroller = TextEditingController();

  void addItemToList() {
    setState(() {
      startdate.insert(0, startdateController.text);
      enddate.insert(0, enddateController.text);
      disease.insert(0, diseaseController.text);
      doctor.insert(0, doctorController.text);
      hospital.insert(0, hospitalController.text);
      medicine.insert(0, medicineController.text);
    });
  }

  Padding repeat({String string, var controller}) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: string,
          labelStyle: TextStyle(
            color: Color(0xff64B4AF),
          ),
          fillColor: Color(0xff64B4AF),
          focusColor: Color(0xff64B4AF),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Medical Record',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                color: Color(0xff64B4AF),
              ),
            ),
            repeat(string: 'Disease', controller: diseaseController),
            Row(
              children: [
                Expanded(
                  child: repeat(
                      string: 'Start-Date', controller: startdateController),
                ),
                Expanded(
                  child:
                      repeat(string: 'End-Date', controller: enddateController),
                ),
              ],
            ),
            repeat(string: 'Doctor', controller: doctorController),
            repeat(string: 'Hospital', controller: hospitalController),
            repeat(string: 'Medicine', controller: medicineController),
            repeat(string: 'Tests', controller: testscontroller),
            Column(
              children: [
                RaisedButton(
                  color: Color(0xff64B4AF),
                  onPressed: () {},
                  child: Icon(Icons.arrow_circle_up),
                ),
                Text('Upload'),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: FlatButton(
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Color(0xff64B4AF),
                onPressed: () {
                  addItemToList();
                  // Navigator.pushAndRemoveUntil(context,
                  //     MaterialPageRoute(builder: (context) {
                  //   return recordsScreen();
                  // }), (Route<dynamic> route) => route is PatientProfileInput);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (Context) {
                      return recordsScreen(widget.UID);
                    }),
                  );
                  firestore().uploadPatientMedicalHistory(
                      widget.size,
                      widget.UID,
                      startdateController.text,
                      enddateController.text,
                      diseaseController.text,
                      doctorController.text,
                      hospitalController.text,
                      medicineController.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
