import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';


import '../collections/collection.dart';
import '../models/consultant_model.dart';
import '../services/consultant_service.dart';
import '../utils/widgets/reusable_widget.dart';

class ConsultantController extends ChangeNotifier{
  ConsultantModel? consultant;
  List<ConsultantModel> consultantList = [];
  List<ConsultantModel> consultantListSearchable = [];
  List<ConsultantModel> pendingConsultantList = [];
  List<ConsultantModel> pendingConsultantListSearchable = [];
  double ratings = 0;
  String? searchString = '';



  bool load=false;
  loader(){
    load = true;
    notifyListeners();
  }

  updateRating(double newRatings){
    ratings= newRatings;
    notifyListeners();
  }

  Stream<QuerySnapshot> getConsultants(){
    return Collections.consultant.snapshots();
  }



  getAllConsultant(){
    ConsultantService.getConsultant()!.listen((event) {
     consultantList.clear();
      event.forEach((element) => consultantList!.add(element));
     notifyListeners();
      onSearchForConsultants(searchString!);
     notifyListeners();

    });
  }
  verifyConsultant(String consultantId)async{
    load = true;
    notifyListeners();
    await ConsultantService.updateConsultantVerification( consultantId);
    load = false;
    notifyListeners();
  }
  updateConsultant(ConsultantModel consultantModel)async{

    load = true;
    notifyListeners();
    await ConsultantService.updateConsultant(consultantModel);
    load = false;
    notifyListeners();
  }
  getAllPendingConsultant(){
    ConsultantService.getPendingConsultant()!.listen((event) {
      pendingConsultantList.clear();
      event.forEach((element) => pendingConsultantList!.add(element));
      print(pendingConsultantList);
      notifyListeners();
      onSearchForPendingConsultants(searchString!);
      notifyListeners();

    });
  }

onSearchForConsultants(String search) {
  searchString = search.toLowerCase();
  notifyListeners();

  consultantListSearchable.clear();

  if (searchString == '' ||  searchString == null) {
    print(consultantList);
    consultantList!.forEach(
            (ConsultantModel element) =>consultantListSearchable.add(element));
    notifyListeners();
  } else {
    consultantList
    !.forEach((ConsultantModel? consultantModel) {

      if (consultantModel
      !.firstName!
          .toLowerCase()
          .contains(searchString!) || consultantModel!.lastName!
          .toLowerCase()
          .contains(searchString!)) {
        consultantListSearchable.add(consultantModel!);
        notifyListeners();
      }

    });
  }

}
  onSearchForPendingConsultants(String search) {
    searchString = search.toLowerCase();
    notifyListeners();

    pendingConsultantListSearchable.clear();


    pendingConsultantList!.forEach(
            (ConsultantModel element) =>pendingConsultantListSearchable.add(element));
    notifyListeners();

  }
}