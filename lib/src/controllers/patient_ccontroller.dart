


import 'package:flutter/foundation.dart';

import '../models/patient_model.dart';
import '../services/patient_service.dart';

class PatientController extends ChangeNotifier{
  List<PatientModel> patientList = [];
  List<PatientModel> patientListSearchable = [];

  String? searchString = '';
  getAllPatient(){
    PatientService.getPatient()!.listen((event) {
      patientList.clear();
      event.forEach((element) => patientList!.add(element));
      notifyListeners();
      onSearchForPatient(searchString!);
      notifyListeners();

    });
  }

  onSearchForPatient(String search) {
    searchString = search.toLowerCase();
    notifyListeners();

    patientListSearchable.clear();

    if (searchString == '' ||  searchString == null) {

      patientList!.forEach(
              (PatientModel element) =>patientListSearchable.add(element));
      notifyListeners();
    } else {
      patientList
      !.forEach((PatientModel? consultantModel) {

        if (consultantModel
        !.firstName!
            .toLowerCase()
            .contains(searchString!) || consultantModel!.lastName!
            .toLowerCase()
            .contains(searchString!)) {
          patientListSearchable.add(consultantModel!);
          notifyListeners();
        }

      });
    }

  }
  bool load= false;
  updatePatient(PatientModel consultantModel)async{

    load = true;
    notifyListeners();
    await PatientService.updatePatient(consultantModel);
    load = false;
    notifyListeners();
  }
}