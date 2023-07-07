import 'package:consult_admin/src/controllers/central_state.dart';
import 'package:consult_admin/src/views/users_db_view/consultant_view.dart';
import 'package:consult_admin/src/views/users_db_view/patient_view.dart';
import 'package:consult_admin/src/views/users_db_view/pending_confirmation.dart';
import 'package:consult_admin/src/views/users_db_view/view_portfolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      AppTheme.lightGreen,
      body: Column(
        children: [
          Gap(35.h),
          Padding(
            padding: const EdgeInsets.only(left:18.0,right:24),
            child: Row(
              children: [
                Image.asset('assets/app_logo.png',width: 87.w,height:77.h),
                Spacer(),

                Padding(
                  padding: const EdgeInsets.only(top:12.0),
                  child: ElevatedButton(onPressed: (){
                    showDialog(context: context, builder:(context){
                      return StatefulBuilder(
                        builder: (context,widget) {
                          return Dialog(
                            child: Container(
                              height: 150.h,width: 183.w,
                              child: Column(
                                children: [
                                  Gap(20),
                                  Text('Are you sure you want',style:GoogleFonts.dmSans(color: AppTheme.black,fontSize: 16.sp,fontWeight: FontWeight.w400),),
                                  Gap(5),
                                  Text('Signout?',style: GoogleFonts.dmSans(color: AppTheme.black,fontSize: 24.sp,fontWeight: FontWeight.w400)),
                                  Gap(10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(onPressed: (){
                                        centralState.logOut();
                                      }, child:Text('yes'), style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, fixedSize: Size(75,32),minimumSize: Size(75,32),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))), ),
                                      Gap(20),
                                      ElevatedButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child:Text('No',style:GoogleFonts.dmSans(color: AppTheme.black,fontSize: 16.sp,fontWeight: FontWeight.w400)), style: ElevatedButton.styleFrom(backgroundColor: AppTheme.white, fixedSize: Size(75,32),minimumSize: Size(75,32),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))), ),

                                    ],
                                  )
                                ],
                              ),

                            ),
                          );
                        }
                      );
                    });
                  }, child:Text('Sign out'), style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, fixedSize: Size(90,26),minimumSize: Size(90,26)), ),
                ),
                // )
              ],
            ),
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.only(left:24.0,right:24),
            child: Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/home.svg',color:AppTheme.primary,height: 24),
                    Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: Text('Home',style: GoogleFonts.dmSans(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500)),
                    ),
                  ],
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
          Gap(31.h),
          Row(
            children: [

              Gap(24.w),
              SelectionBox(imageName: 'patient.svg',onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientsView()));

              },title: 'View Patients',),
              Spacer(),
              SelectionBox(imageName: 'consultant.svg',onTap: (){  Navigator.push(context, MaterialPageRoute(builder: (context)=>ConsultantView()));
              },title: 'View consultants',),
              Gap(24.w),
            ],
          ),
          Gap(64.h),
          Row(
            children: [
              Gap(56.w),
              Image.asset("assets/notification_bell.png",height: 16,width: 16,),  Gap(8.w),
              Text('Pending confirmation',style: GoogleFonts.dmSans(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500)),
              Gap(56.w),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PendingConfirmation()));
              }, child:Text('View'), style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, fixedSize: Size(67,26),minimumSize: Size(67,26)), ),

            ],
          )

        ],
      ),
    );
  }
}

class SelectionBox extends StatelessWidget {
  String imageName;
  Function() onTap;
  String? title;
   SelectionBox({
    super.key,required this.onTap,required this.imageName,this.title
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 171.w, height: 144.h,
            child: Center(child: SvgPicture.asset('assets/$imageName',height: 64.h,width: 64.w,)),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppTheme.white),
          ),

          ElevatedButton(onPressed:onTap, child:Text('$title'), style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, fixedSize: Size(170.w,26.h),minimumSize: Size(140.w,26.h)), ),

        ],
      ),
    );
  }
}


class TimeWidget extends StatelessWidget {
  String? time;
  TimeWidget({
    Key? key,this.time
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height:
    32.h,width:32.w,child:Center(child: Text('$time')),decoration:
    BoxDecoration(borderRadius: BorderRadius
        .circular(5),color: AppTheme.white),);
  }
}
