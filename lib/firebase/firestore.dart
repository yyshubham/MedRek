import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class firestore {
  //add user date in firestore

  final CollectionReference doctor =
      FirebaseFirestore.instance.collection('doctor');

  final CollectionReference patient =
      FirebaseFirestore.instance.collection('patient');

  void uploadPatientData(
      String name,
      String email,
      String mobile,
      String gender,
      String age,
      String bloodGroup,
      String profession,
      String UID,
      String imageURL) {
    patient.doc(UID).set({
      'name': name,
      'email': email,
      'mobile': mobile,
      'gender': gender,
      'age': age,
      'bloodGroup': bloodGroup,
      'profession': profession,
      'UID': UID,
      'imageURL': imageURL
    });
  }

  Future<Map<String, dynamic>> getPatientData() async {
    Map<String, dynamic> map;
    String UID = FirebaseAuth.instance.currentUser.uid;
    DocumentSnapshot documentSnapshot = await patient.doc(UID).get();
    map = documentSnapshot.data();
    return map;
  }

  void uploadDoctorData() {}

  void getDoctorData() {}
}
