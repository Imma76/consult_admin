import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../collections/collection.dart';
import '../models/admin.dart';

class AdminService{

  static Future findAdminById(String userId)async{
    try{
      DocumentSnapshot
      user = await Collections.adminCollection.doc(userId).get();
      if(!user.exists){
        return null;
      }
      return AdminModel.fromJson(user.data() as Map
      );

    }on SocketException{
      return null;
    } catch(e){
      return null;
    }
  }
}