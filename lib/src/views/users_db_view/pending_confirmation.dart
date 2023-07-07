import 'package:consult_admin/src/all_providers/all_providers.dart';
import 'package:consult_admin/src/views/users_db_view/view_portfolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';
import '../../utils/widgets/app_bar.dart';
import '../../utils/widgets/loader.dart';
import '../home/home_page.dart';

class PendingConfirmation extends ConsumerStatefulWidget {
  const PendingConfirmation({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PendingConfirmationState();
}

class _PendingConfirmationState extends ConsumerState<PendingConfirmation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(consultantProvider).getAllPendingConsultant();

  }
  @override
  Widget build(BuildContext context) {
    final consultantController = ref.watch(consultantProvider);

    return Scaffold(
      backgroundColor:
      AppTheme.lightGreen,
      appBar: PrimaryAppBar(context),
      body: Column(
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
                Image.asset("assets/notification_bell.png",height: 16,width: 16,),  Gap(8.w),

                Padding(
                  padding: const EdgeInsets.only(top:5.0),
                  child: Text('Pending confirmation',style: GoogleFonts.dmSans(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500)),
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
          Gap(40.h),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index){

            return   Padding(
              padding: const EdgeInsets.all(8.0),
              child:  UserListBox(
                title1: 'View portfolio',
                title2: 'confirm',

                userId: consultantController.pendingConsultantListSearchable[index].userId,
                load: consultantController.load,
                name: '${consultantController.pendingConsultantListSearchable[index].firstName} ${consultantController.pendingConsultantListSearchable[index].lastName}',
                onTap1: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPortfolio(consultantModel: consultantController.pendingConsultantListSearchable[index])));
                },
                onTap2: ()async{
                  await consultantController.verifyConsultant(consultantController.pendingConsultantListSearchable[index].userId!);
                },
              ),
            );
          },itemCount:consultantController.pendingConsultantListSearchable.length ,),
          consultantController.load?Indicator2():SizedBox()
        ],
      ),
    );
  }
}

class UserListBox extends ConsumerWidget {
  final String? title1;
  final String?title2;
  final String? userId;
  final Function()? onTap1;
  final Function()? onTap2;
  final String? name;
  final bool? load;

  const UserListBox({
    super.key,this.onTap1,this.onTap2,this.title1,this.title2,this.load,this.name,this.userId
  });

  @override
  Widget build(BuildContext context,ref) {
    final consultantController = ref.watch(consultantProvider);
    return Container(
      height: 70.h,
      width: 382.w,
      child: Column(
        children: [
          Row(children: [
            Gap(16.w),
            Expanded(child: Text('$name',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500))),

            ElevatedButton(onPressed: onTap1,child:Text('$title1'), style: ElevatedButton.styleFrom(backgroundColor:title1 == 'View portfolio'? AppTheme.primary:AppTheme.restrict, fixedSize: Size(145.w,26.h),minimumSize: Size(133.w,26.h)), ),
            Gap(10),
            ElevatedButton(onPressed:onTap2, child:Text('$title2'), style: ElevatedButton.styleFrom(backgroundColor:title2 == 'confirm' ?AppTheme.primary:AppTheme.ban, fixedSize: Size(100.w,26.h),minimumSize: Size(90.w,26.h)), ),

            Gap(16.w),
          ],),
          Expanded(child: Text('user id: $userId',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500))),

        ],
      ),
      decoration: BoxDecoration(color: AppTheme.white,borderRadius:
      BorderRadius.circular(5)),
    );
  }
}
