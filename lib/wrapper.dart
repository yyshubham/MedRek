import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mhack/patientportfolio.dart';
import 'package:mhack/screens/doctor_profile_input.dart';
import 'package:mhack/screens/patient_profile_input.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widget/logged_in_widget.dart';
import 'widget/sign_up_widget.dart';
import 'widget/background_painter.dart';
import 'provider/google_sign_in.dart';
import 'package:mhack/Doctor.dart';

class wrapper extends StatefulWidget {
  SharedPreferences preferences;
  wrapper(this.preferences);
  @override
  _wrapperState createState() => _wrapperState(preferences);
}

class _wrapperState extends State<wrapper> {
  SharedPreferences sharedPreferences;
  _wrapperState(this.sharedPreferences);
  bool role;
  @override
  void initState() {
    // TODO: implement initState
    role = sharedPreferences.getBool('checkRole');
    print("ROLE:$role");
    super.initState();
  }

  @override
  Widget build(BuildContext context) => role == null
      ? Center(
          child: CircularProgressIndicator(),
        )
      : Scaffold(
          body: ChangeNotifierProvider(
            create: (context) => GoogleSignInProvider(),
            child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                print("NO");
                print(role);
                print("YO");
                final provider = Provider.of<GoogleSignInProvider>(context);
                if (provider.isSigningIn) {
                  print(1);
                  return buildLoading();
                } else if (snapshot.hasData) {
                  print(2);
                  if (role == true)
                    return PatientProfileInput();
                  else
                    return DoctorProfileInput();
                  // return role == false
                  //     ? PatientProfileInput()
                  //     : DoctorProfileInput();
                } else {
                  print(3);
                  return SignUpWidget();
                }
              },
            ),
          ),
        );

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          Center(child: CircularProgressIndicator()),
        ],
      );
}
