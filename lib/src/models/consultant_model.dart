import 'package:cloud_firestore/cloud_firestore.dart';

class ConsultantModel{

  String? userName;
  String? email;
  String? verificationStatus;
  String? firstName;
  String? lastName;
  String? age;
  String? phoneNumber;
  String? stateOfOrigin;
  String? gender;
  String? lga;
  String? residentialAddress;
  DateTime? createdAt;
  String? userId;
  String? cv;
  String? areaOfSpecialty;
  String? medicalLicense;
  String? photoUrl;
  String?history;
  double? ratings;
  String? consultantId;
  ConsultantModel({this.email,this.userName,this.lastName,this.userId,this.firstName,this.phoneNumber,this.areaOfSpecialty,this.cv
    ,this.createdAt,this.age,this.gender,this.history
    ,this.medicalLicense,this.photoUrl
    ,this.residentialAddress,this.verificationStatus
    ,this.stateOfOrigin,this.lga,this.ratings,this.consultantId});

  ConsultantModel.fromJson(Map<dynamic,dynamic> data){

    userName=data['userName'];
    email=data['email'];
    firstName=data['firstName'];
    lastName=data['lastName'];
    verificationStatus = data['verificationStatus']??'';
    age=data['age'];
    cv=data['cvUrl'];
    residentialAddress
    =data['residentialAddress'];
    gender=data['gender'];
    photoUrl=data['photoUrl'];
    history=data['history'];
    userId=data['userId'];
    lga=data['lga'];
    if(data['createdAt']!=null)
    createdAt=Timestamp(data['createdAt'].seconds,data['createdAt'].nanoseconds).toDate();
    phoneNumber=data['phoneNumber'];
    if(data['ratings']!= null)
    ratings=double.parse(data['ratings'].toString());
    stateOfOrigin=data['stateOfOrigin'];
    areaOfSpecialty=data['areaOfSpecialty'];
    consultantId=data['userId'];
    medicalLicense = data['medicalLicense'];
  }

  toJson(){
    Map<String,dynamic> data={};
    data['userName']=userName;
    data['email']=email;
    data['firstName']=firstName;
    data['lastName']=lastName;
    data['age']=age;
    data['cvUrl']= cv;
    data['medicalLicense']=medicalLicense;
    data['residentialAddress']=residentialAddress;
    data['gender']=gender;
    data[
      'verificationStatus'
    ] = verificationStatus;
    data['photoUrl']= photoUrl;
    data['history']=  history;
    data['userId']=  userId;
    data['lga']= lga;
    data['createdAt']=createdAt;
    data['phoneNumber']=phoneNumber;
    data['ratings']=ratings;
    data['stateOfOrigin']=stateOfOrigin;
    data['areaOfSpecialty']=areaOfSpecialty;
    data['consultantId']=consultantId;
    return data;
  }
}