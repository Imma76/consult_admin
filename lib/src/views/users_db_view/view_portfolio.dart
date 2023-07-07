import 'package:consult_admin/src/models/consultant_model.dart';
import 'package:consult_admin/src/views/users_db_view/pending_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_filereader/flutter_filereader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';
import '../../utils/widgets/app_bar.dart';
import '../home/home_page.dart';

class ViewPortfolio extends ConsumerStatefulWidget {
  final ConsultantModel consultantModel;
  const ViewPortfolio({
    Key? key,required this.consultantModel
  }) : super(key: key);

  @override
  ConsumerState createState() => _PendingConfirmationState();
}

class _PendingConfirmationState extends ConsumerState<ViewPortfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      AppTheme.lightGreen,
      appBar: PrimaryAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                SvgPicture.asset("assets/profile4.svg",height: 16,width: 16,),  Gap(8.w),

                Padding(
                  padding: const EdgeInsets.only(bottom:2.0),
                  child: Text('Profile',style: GoogleFonts.dmSans(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500)),
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
                ),
              ],
            ),
          ),
          Gap(20.h),
          Gap(16.h),
          Row(
            children: [
              Gap(20.w),
            //  CircleAvatar(backgroundColor: AppTheme.lightBlack,radius: 2,),Gap(4),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'First Name:',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: ' ${widget.consultantModel.firstName} ',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2
                            ,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),
          Gap(4),
          Row(
            children: [
              Gap(20.w),
              //CircleAvatar(backgroundColor: AppTheme.lightBlack,radius: 2,),Gap(4),

              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Last Name:',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: ' ${widget.consultantModel.lastName}',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2
                            ,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),
          Gap(4),
          Row(
            children: [
              Gap(20.w),
              //CircleAvatar(backgroundColor: AppTheme.lightBlack,radius: 2,),Gap(4),

              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Email address',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: ' ${widget.consultantModel.email}',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2
                            ,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),
          Gap(4),
          Row(
            children: [
              Gap(20.w),
              //CircleAvatar(backgroundColor: AppTheme.lightBlack,radius: 2,),Gap(4),

              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Phone number:',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: ' ${widget.consultantModel.phoneNumber}',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2
                            ,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),
          Gap(4),
          Row(
            children: [
              Gap(20.w),
             // CircleAvatar(backgroundColor: AppTheme.lightBlack,radius: 2,),Gap(4),

              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'State of origin:',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: ' ${widget.consultantModel.stateOfOrigin}',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2
                            ,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),
          Gap(4),
          Row(
            children: [
              Gap(20.w),
              //CircleAvatar(backgroundColor: AppTheme.lightBlack,radius: 2,),Gap(4),

              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Local government',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: ' ${widget.consultantModel.lga}',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2
                            ,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),
          Gap(4),
          Row(
            children: [
              Gap(20.w),
              //CircleAvatar(backgroundColor: AppTheme.lightBlack,radius: 2,),Gap(4),

              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Age:',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: ' ${widget.consultantModel.age}',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2
                            ,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),
          Gap(4),
          Row(
            children: [
              Gap(20.w),
              //CircleAvatar(backgroundColor: AppTheme.lightBlack,radius: 2,),Gap(4),

              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Gender:',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: ' ${widget.consultantModel.gender}',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2
                            ,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),
          Gap(4),
          Row(
            children: [
              Gap(20.w),
              //CircleAvatar(backgroundColor: AppTheme.lightBlack,radius: 2,),Gap(4),

              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Residential address:',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: ' ${widget.consultantModel.residentialAddress}',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2
                            ,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),
          Gap(4),
          Row(
            children: [
              Gap(20.w),
             // CircleAvatar(backgroundColor: AppTheme.lightBlack,radius: 2,),Gap(4),

              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Area of specialty:',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: ' ${widget.consultantModel.areaOfSpecialty}',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppTheme.black2
                            ,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),

          Gap(20),
          Padding(
            padding: const EdgeInsets.only(left:20.0),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FileReaderPage(filePath: widget.consultantModel.cv!)));

            }, child:Text('View CV '), style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, fixedSize: Size(90.w,26),minimumSize: Size(99.w,26.h)), ),
          ),
          Gap(5),
          Padding(
            padding: const EdgeInsets.only(left:20.0),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FileReaderPage(filePath: widget.consultantModel.medicalLicense!)));
            }, child:Text('View medical license'), style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, fixedSize: Size(200.w,26.h),minimumSize: Size(90.w,26.h)), ),
          ),
          Gap(5),
          Padding(
            padding: const EdgeInsets.only(left:20.0),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FileReaderPage(filePath: widget.consultantModel.photoUrl!)));
            }, child:Text('View photo'), style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, fixedSize: Size(120.w,26.h),minimumSize: Size(110.w,26.h)), ),
          ),


        ],
      ),
    );
  }
}




class FileReaderPage extends StatefulWidget {
  final String filePath;

  FileReaderPage({Key: Key,required  this.filePath});

  @override
  _FileReaderPageState createState() => _FileReaderPageState();
}

class _FileReaderPageState extends State<FileReaderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(context),
      body: WebviewScaffold( url: '${widget.filePath}', withZoom: true, withLocalStorage: true, )
    );
  }
}