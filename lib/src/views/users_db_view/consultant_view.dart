import 'package:consult_admin/src/models/consultant_model.dart';
import 'package:consult_admin/src/utils/widgets/reusable_widget.dart';
import 'package:consult_admin/src/views/users_db_view/pending_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../all_providers/all_providers.dart';
import '../../themes/app_theme.dart';
import '../../utils/widgets/app_bar.dart';
import '../../utils/widgets/loader.dart';
import '../home/home_page.dart';

class ConsultantView extends ConsumerStatefulWidget {
  const ConsultantView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PendingConfirmationState();
}

class _PendingConfirmationState extends ConsumerState<ConsultantView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(consultantProvider).getAllConsultant();

  }
  @override
  Widget build(BuildContext context) {
    final consultantController = ref.watch(consultantProvider);
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
                    child: Text('Consultants',style: GoogleFonts.dmSans(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500)),
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
                              onChanged: consultantController.onSearchForConsultants,
                          cursorColor: AppTheme.black2,
                          decoration: InputDecoration
                            (hintText: 'Search consultant',
                              hintStyle:
                              GoogleFonts.poppins(color: AppTheme.black2.withOpacity(0.8),fontSize: 12.sp,fontWeight: FontWeight.w400) ,

                              //     prefixIcon: Icon(Icons.search,color:
                              //   AppTheme.black2,size:
                              //
                              //       24.sp,
                              // ),
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
                    userId: consultantController.consultantListSearchable[index].userId,
                    title1: getStatusForRestricted(consultantController.consultantListSearchable[index].verificationStatus!),
                    title2: getStatusForBanned('${consultantController.consultantListSearchable[index].verificationStatus}'),
                    load: consultantController.load,
                    name: '${consultantController.consultantListSearchable[index].firstName} ${consultantController.consultantListSearchable[index].lastName}',
                    onTap1: ()async{
                      ConsultantModel consultantModel =     consultantController.consultantListSearchable[index];
                      if(consultantModel.verificationStatus != 'restricted'){
                        consultantModel.verificationStatus = 'restricted';

                        await consultantController.updateConsultant(consultantModel);
                        showToast('consultant restricted');
                      }else{
                        consultantModel.verificationStatus = '';

                        await consultantController.updateConsultant(consultantModel);
                        showToast('consultant unrestricted');
                      }


                    },
                    onTap2: ()async{
                      ConsultantModel consultantModel =     consultantController.consultantListSearchable[index];
                      if(consultantModel.verificationStatus != 'banned'){
                        consultantModel.verificationStatus = 'banned';

                        await consultantController.updateConsultant(consultantModel);
                        showToast('consultant banned');
                      }else{
                        consultantModel.verificationStatus = '';

                        await consultantController.updateConsultant(consultantModel);
                        showToast('consultant unbanned');
                      }

                    },
                  ),
                );
              },itemCount:consultantController.consultantListSearchable.length ,),

            consultantController.load?Indicator2():SizedBox()
          ],
        ),
      ),
    );
  }
}

String getStatusForRestricted(String status){
  if(status == 'restricted'){
    return 'Unrestrict';
  }else if(status == 'unrestricted'){
    return 'restrict';

  }else{
    return 'Restrict';
  }
}
String getStatusForBanned(String status){
   if(status == 'banned'){
    return 'Unban';
  }else{
    return 'Ban';
  }
}