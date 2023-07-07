



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/auth_controller.dart';
import '../controllers/central_state.dart';
import '../controllers/consultant_controller.dart';
import '../controllers/patient_ccontroller.dart';
import '../controllers/user_controller.dart';


final centralProvider = ChangeNotifierProvider<CentralState>((ref) =>CentralState());
final userProvider = ChangeNotifierProvider<UserController
>((ref) => UserController());
final consultantProvider = ChangeNotifierProvider<ConsultantController>((ref) => ConsultantController());
final authProvider = ChangeNotifierProvider<AuthController>((ref) => AuthController());

final patientProvider = ChangeNotifierProvider<PatientController>((ref) =>PatientController());
