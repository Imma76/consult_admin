import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import '../collections/collection.dart';
import '../controllers/user_controller.dart';
import '../models/admin.dart';
import '../models/patient_model.dart';
import '../utils/error_codes.dart';
import '../utils/widgets/reusable_widget.dart';

class PatientService{



 static  Stream<List<PatientModel>>? getPatient( {String? orderBy = 'createdAt',
   bool? descending = true,
   var startAt,}){
   try{
     Query query =  Collections.patientCollection.orderBy("createdAt",descending: true);

     return query.snapshots()
         .map((snapShot) => snapShot.docs.map<PatientModel>((consultant) {
       print(consultant);
       Map _temp = consultant.data() as Map<dynamic, dynamic>;
       _temp['docId'] = consultant.id;
       // //(_temp);
       return PatientModel.fromJson(_temp as Map<String, dynamic>);
     }).toList());
   }catch(e){
     return null;
   }
 }
 static Future sendEmail(String message,{String? email})async{
   try{
     final response= await http.post(Uri.parse('https://email-service-fsmn.onrender.com/mail'),body: {
       "name":"Consult",
     //  "receiver":email??userController.patient!.email,
       "message":"${message}",
       "sender":"Consultant@gmail.com"
     });
     print(response.body);
   }catch(e){
     print(e.toString());
   }
 }

 static Future updatePatient(PatientModel patientModel)async{

   try{
     await Collections.consultant.doc(patientModel.userId).update(patientModel.toJson());
     return true;
   }catch(e){
     showToast(e.toString());
     return false;
   }
 }

}