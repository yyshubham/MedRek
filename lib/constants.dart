import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final List<String> startdate = <String>['7/03/21'];
final List<String> enddate = <String>['14/03/21'];
final List<String> disease = <String>['Corona'];
final List<String> doctor = <String>['JK Singh'];
final List<String> hospital = <String>['JK Hospital'];
final List<String> medicine = <String>['Paracetamol'];
final List<String> tests = <String>['BP check'];


Map<String, dynamic> map;
Map<String, dynamic> doctormap;

// Barcode result;