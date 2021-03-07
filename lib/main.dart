import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:mhack/widget/checkRole.dart';
import 'package:mhack/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget screen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  print(sharedPreferences.getBool('checkRole'));
  print(sharedPreferences.getBool('checkRole'));
  if (sharedPreferences.getBool('checkRole') ?? false)
    // screen = checkRole(sharedPreferences);
    screen = wrapper(sharedPreferences);
  else
    screen = checkRole(sharedPreferences);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: screen);
  }
}
