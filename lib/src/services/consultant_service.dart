import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consult_admin/src/utils/widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../collections/collection.dart';
import '../models/consultant_model.dart';
import '../utils/error_codes.dart';

class ConsultantService{
  static Future findPatient(String userName)async{
    try{
      QuerySnapshot user = await Collections.patientCollection.where(userName,isEqualTo:"userName").get();
      if(user.docs.isNotEmpty){
        final userData = user as Map<dynamic,dynamic>;
        return ConsultantModel.fromJson(userData);
      }
      return null;

    }on SocketException{
      return null;
    } catch(e){
      return null;
    }
  }

  static Future findConsultantById(String userId)async{
    try{
      DocumentSnapshot
      user = await Collections.consultant.doc(userId).get();
      if(!user.exists){
        return null;
      }

      return ConsultantModel.fromJson(user.data() as Map
      );

    }on SocketException{
      return null;
    } catch(e){
      return null;
    }
  }
 static  Stream<List<ConsultantModel>>? getConsultant( {String? orderBy = 'createdAt',
    bool? descending = true,
    var startAt,}){
    try{
      Query query =  Collections.consultant.orderBy("createdAt",descending: true).where("isVerified",isEqualTo:true);

      return query.snapshots()
          .map((snapShot) => snapShot.docs.map<ConsultantModel>((consultant) {
            print(consultant);
        Map _temp = consultant.data() as Map<dynamic, dynamic>;
        _temp['docId'] = consultant.id;

        // //(_temp);
        return ConsultantModel.fromJson(_temp as Map<String, dynamic>);
      }).toList());
    }catch(e){
      return null;
    }
  }
  static  Stream<List<ConsultantModel>>? getPendingConsultant( {String? orderBy = 'createdAt',
    bool? descending = true,
    var startAt,}){
    try{
      Query query =  Collections.consultant.where("isVerified",isEqualTo:false);

      return query.snapshots()
          .map((snapShot) => snapShot.docs.map<ConsultantModel>((consultant) {

        Map _temp = consultant.data() as Map<dynamic, dynamic>;
        _temp['docId'] = consultant.id;
        // //(_temp);
        return ConsultantModel.fromJson(_temp as Map<String, dynamic>);
      }).toList());
    }catch(e){
      return null;
    }
  }

  static Future createConsultant(ConsultantModel consultant)async{
    try{
      final user = await Collections.consultant.doc(consultant.userId).set(consultant.toJson());
      return true;
    }on SocketException {
      return null;
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  static Future updateConsultantRatings(double ratings, String? consultantId)async{
    print(ratings);
    try{
      await Collections.consultant.doc(consultantId).update({"ratings":ratings});
      return true;
    }catch(e){
      return false;
    }
    }
  static Future updateConsultantVerification(String? consultantId)async{

    try{
      await Collections.consultant.doc(consultantId).update({"isVerified":true});
      return true;
    }catch(e){
      showToast(e.toString());
      return false;
    }
  }
  static Future updateConsultant(ConsultantModel consultantModel)async{

    try{
      await Collections.consultant.doc(consultantModel.userId).update(consultantModel.toJson());
      return true;
    }catch(e){
      showToast(e.toString());
      return false;
    }
  }
}