
import 'package:consult_admin/src/services/admi_service.dart';
import 'package:consult_admin/src/utils/widgets/reusable_widget.dart';
import 'package:consult_admin/src/views/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../models/admin.dart';
import '../models/patient_model.dart';
import '../services/patient_service.dart';
import 'central_state.dart';

class UserController extends ChangeNotifier{

  AdminModel? admin;
  init()async{
    centralState.startLoading();
   admin= await AdminService.findAdminById(FirebaseAuth
       .instance.currentUser
   !.uid);
   if(admin == null){
     showToast("Admin does not exist");
     return;
   }

   Navigator.push(navigatorKey!
       .currentContext!, MaterialPageRoute(builder: (context)=>HomePage()));

   centralState.stopLoading();
   notifyListeners();
  }
}

UserController userController = UserController();