import 'package:flutter/material.dart';
import 'package:mhack/widget/checkRole.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mhack/wrapper.dart';

Widget screen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if (sharedPreferences.getBool('checkRole') ?? false)
    screen = wrapper();
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
