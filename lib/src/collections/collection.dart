
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


FirebaseFirestore firebaseCloud= FirebaseFirestore.instance;
class Collections{

  static CollectionReference patientCollection = firebaseCloud.collection("patients");
  static CollectionReference adminCollection = firebaseCloud.collection("admin");
  static CollectionReference consultant = firebaseCloud.collection("consultants");
  static CollectionReference appointment = firebaseCloud.collection("appointment");
}