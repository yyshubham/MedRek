import 'package:flutter/material.dart';
import 'package:mhack/screens/patient_profile_input.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'widget/logged_in_widget.dart';
import 'widget/sign_up_widget.dart';
import 'widget/background_painter.dart';
import 'provider/google_sign_in.dart';
import 'package:mhack/Doctor.dart';

class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);
              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapshot.hasData) {
                return PatientProfileInput();
              } else {
                return doctor();
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
