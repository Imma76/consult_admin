import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel{


  String? email;

  DateTime? createdAt;
  String? userId;

  AdminModel({this.email,this.userId,this.createdAt,});

  AdminModel.fromJson(Map<dynamic,dynamic> data){

    email=data['email'];

    if(data['createdAt']!=null)
      createdAt=Timestamp(data['createdAt'].seconds,data['createdAt'].nanoseconds).toDate();

    userId=data['userId'];
  }

  toJson(){
    Map<String,dynamic> data=<String, dynamic>{};

    data['email']=email;
    data['userId']=userId;
    data['createdAt']=createdAt;
    return data;
  }
}