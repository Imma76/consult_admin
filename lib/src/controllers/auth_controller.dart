
import 'package:consult_admin/src/controllers/user_controller.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../services/auth_service.dart';
import '../utils/widgets/reusable_widget.dart';


class AuthController extends ChangeNotifier{
  bool load = false;
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
 // TextEditingController userNameController= TextEditingController();
  TextEditingController genderController= TextEditingController(text: '');
  TextEditingController surNameController= TextEditingController();
  TextEditingController firstNameController= TextEditingController();
  TextEditingController lastNameController= TextEditingController();
  TextEditingController ageController= TextEditingController();
  TextEditingController weightController= TextEditingController();
  TextEditingController heightController= TextEditingController();
  TextEditingController allergiesController= TextEditingController();
  TextEditingController medicalConditionsController= TextEditingController();

  TextEditingController userNameController= TextEditingController();


  changeGender (value) {
    genderController.text =value!;
    notifyListeners();
    notifyListeners();
  }



  AuthService authService = AuthService();

  void logOut()async{

  }
  Future signIn(centralState)async{
load = true;
notifyListeners();

    final user=await authService.signIn(email: emailController.text.trim(),password: passwordController.text);
    if(user==null){
      load = false;
      notifyListeners();
      centralState.stopLoading();
      return;
    }
   await userController.init();
    emailController.clear();
    passwordController.clear();
load = false;
notifyListeners();
   // if(login ){
   //   load=false;
   //   notifyListeners();
   //
   // }
  centralState.stopLoading();
   // Navigator.pushNamedAndRemoveUntil(navigatorKey!
   //     .currentContext!, Base.id, (route) => false);

  }
  clearControllers(){
    emailController.clear();
    passwordController.clear();
    genderController.clear();
    firstNameController.clear();
    lastNameController.clear();

  }

  bool checkInputForSignUp(){
    // if(surNameController.text.isEmpty){
    //   showToast('fill in surname');
    //   return false;;
    // }
    if(firstNameController.text.isEmpty){
      showToast('fill in first name');
      return false;;
    }
    if(lastNameController.text.isEmpty){
      showToast('fill in last name');
      return false;;
    }
    if(emailController
        .text.isEmpty){
      showToast('fill in your email address');
      return false;;
    }
    if(genderController.text.isEmpty){
      showToast('fill in your gender');
      return false;;
    }
    if(ageController.text.isEmpty){
      showToast('fill in your age');
      return false;
    }
    if(passwordController.text.isEmpty){
      showToast('fill in your password');
      return false;
    }
    return true;
  }

  bool checkInputForSignIn(){
    if(emailController.text.isEmpty){
      showToast('fill in your email');
      return false;
    }
    if(passwordController.text.isEmpty){
      showToast('fill in your password');
      return false;
    }
    return true;
  }
  bool loadAuth = false;



}