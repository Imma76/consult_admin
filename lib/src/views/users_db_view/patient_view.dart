import 'package:consult_admin/src/views/users_db_view/pending_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../all_providers/all_providers.dart';
import '../../models/patient_model.dart';
import '../../themes/app_theme.dart';
import '../../utils/widgets/app_bar.dart';
import '../../utils/widgets/loader.dart';
import '../../utils/widgets/reusable_widget.dart';
import '../home/home_page.dart';
import 'consultant_view.dart';

class PatientsView extends ConsumerStatefulWidget {
  const PatientsView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PendingConfirmationState();
}

class _PendingConfirmationState extends ConsumerState<PatientsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(patientProvider).getAllPatient();
  }
  @override
  Widget build(BuildContext context) {
    final patientController = ref.watch(patientProvider);
    return Scaffold(
      backgroundColor:
      AppTheme.lightGreen,
      appBar: PrimaryAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:18.0,right:24),
              child: Row(
                children: [
                  Image.asset('assets/app_logo.png',width: 87.w,height:77.h),
                  Spacer(),


                  // )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:24.0,right:24),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:5.0),
                    child: Text('Patients',style: GoogleFonts.dmSans(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500)),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top:12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(

                          children: [
                            TimeWidget(time: DateTime.now().day.toString(),),Gap(8.w), TimeWidget(time: DateTime.now().month.toString(),),Gap(8.w), TimeWidget(time: '${DateTime.now().year}'.split('0')[1],)

                          ],
                        ),
                        Gap(4.h),
                        Text('Date',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w600))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Gap(20.h),
            Padding(
              padding: const EdgeInsets.only(left:24.0,right:24),
              child: Container(
                height: 32.h,
                width:382.w,

                padding: EdgeInsets.only(left:24),
                child:Row(
                  children: [

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:2.0),
                        child: TextField(
                          onChanged: patientController.onSearchForPatient,
                          cursorColor: AppTheme.black2,
                          decoration: InputDecoration
                            (hintText: 'Search patient',
                              hintStyle:
                              GoogleFonts.poppins(color: AppTheme.black2.withOpacity(0.8),fontSize: 12.sp,fontWeight: FontWeight.w400) ,
                              enabledBorder:
                              InputBorder.none,
                              focusedBorder: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(color: AppTheme.white,borderRadius:
                BorderRadius.circular(20)
                ),
              ),
            ),
            Gap(40.h),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index){

                return   Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  UserListBox(
                    userId: patientController.patientListSearchable[index].userId,
                    title1: getStatusForRestricted(patientController.patientListSearchable[index].verificationStatus!),
                    title2: getStatusForBanned('${patientController.patientListSearchable[index].verificationStatus}'),

                    name: '${patientController.patientListSearchable[index].firstName} ${patientController.patientListSearchable[index].lastName}',
                    onTap1: ()async{
                      PatientModel patientModel =    patientController.patientListSearchable[index];
                      if(patientModel.verificationStatus != 'restricted'){
                        patientModel.verificationStatus = 'restricted';

                        await patientController.updatePatient(patientModel);
                        showToast('consultant restricted');
                      }else{
                        patientModel.verificationStatus = '';

                        await patientController.updatePatient(patientModel);
                        showToast('consultant unrestricted');
                      }


                    },
                    onTap2: ()async{
                      PatientModel patienttModel =     patientController.patientListSearchable[index];
                      if(patienttModel.verificationStatus != 'banned'){
                        patienttModel.verificationStatus = 'banned';

                        await patientController.updatePatient(patienttModel);
                        showToast('consultant banned');
                      }else{
                        patienttModel.verificationStatus = '';

                        await patientController.updatePatient(patienttModel);
                        showToast('consultant unbanned');
                      }

                    },
                  ),
                );
              },itemCount:patientController.patientListSearchable.length ,),
            patientController.load?Indicator2():SizedBox()
          ],
        ),
      ),
    );
  }
}