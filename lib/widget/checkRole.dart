import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhack/widget/logged_in_widget.dart';
import 'package:mhack/widget/sign_up_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mhack/Doctor.dart';

class checkRole extends StatefulWidget {
  SharedPreferences preferences;
  checkRole(this.preferences);
  @override
  _checkRoleState createState() => _checkRoleState(preferences);
}

class _checkRoleState extends State<checkRole> {
  SharedPreferences sharedPreferences;
  _checkRoleState(this.sharedPreferences);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(45),
              child: Text(
                'Select Role',
                style: GoogleFonts.montserrat(
                    color: Colors.grey[900],
                    fontWeight: FontWeight.normal,
                    fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  sharedPreferences.setBool('checkRole', true);
                  print("Y");
                  bool x = sharedPreferences.getBool('checkRole');
                  print(x);
                  //print(sharedPreferences.getBool('patient'));
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => SignUpWidget()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey[800])],
                    color: Colors.grey[200],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          alignment: Alignment.centerLeft,
                          image: AssetImage('assets/images/patient.png')),
                      Text('Patient',
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.normal)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  sharedPreferences.setBool('checkRole', false);
                  // sharedPreferences.setBool('patient', false);
                  print("N");
                  bool x = sharedPreferences.getBool('checkRole');
                  print(x);
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => SignUpWidget()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey[800])],
                    color: Colors.grey[200],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                          alignment: Alignment.centerLeft,
                          image: AssetImage('assets/images/doctor.png')),
                      Center(
                        child: Text('Medical Officer/\nDoctor',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
