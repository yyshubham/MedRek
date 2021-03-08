import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mhack/Doctor.dart';
import 'package:mhack/constants.dart';

class firestore {
  //add user date in firestore

  final CollectionReference doctor =
      FirebaseFirestore.instance.collection('doctor');

  final CollectionReference patient =
      FirebaseFirestore.instance.collection('patient');

  void uploadPatientMedicalHistory(
      int size,
      String UID,
      String startDate,
      String endDate,
      String disease,
      String doctor,
      String hospital,
      String medicine) {
    String medID = UID + size.toString();
    print("YO");
    print(medID);
    CollectionReference medicalHistory = patient.doc(UID).collection('history');
    medicalHistory.doc(medID).set({
      'start': startDate,
      'end': endDate,
      'disease': disease,
      'doctor': doctor,
      'hospital': hospital,
      'medicine': medicine
    });
  }

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

  void uploadDoctorData(
      String name,
      String email,
      String mobile,
      String qualification,
      String specialization,
      String hospital,
      String address,
      String UID,
      String imageURL) {
    doctor.doc(UID).set({
      'name': name,
      'email': email,
      'mobile': mobile,
      'qualification': qualification,
      'specialization': specialization,
      'hospital': hospital,
      'address': address,
      'UID': UID,
      'imageURL': imageURL
    });
  }

  Future<Map<String, dynamic>> getDoctorData() async {
    Map<String, dynamic> temp;
    String UID = FirebaseAuth.instance.currentUser.uid;
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('doctor').doc(UID).get();
    temp = documentSnapshot.data();
    return temp;
  }
}
