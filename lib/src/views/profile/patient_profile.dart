// import 'package:consult_patient/src/controllers/central_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../controllers/user_controller.dart';
// import '../../themes/app_theme.dart';
//
// class PatientProfile extends ConsumerWidget {
//   const PatientProfile({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//         actions: [
//           IconButton(icon:Icon(Icons.logout,color: AppTheme.greyMessageColor,),onPressed: ()async{
//             centralState!.logOut();
//           },)
//         ],
//       ),
//       backgroundColor:
//       AppTheme.lightGreen,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         //mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Gap(30),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     //Gap(20),
//                     Center(
//                       child: CircleAvatar(
//                         radius: 50,
//                         backgroundColor: AppTheme.white,
//                         child: Icon(Icons.person,color:
//                         AppTheme.primary,size: 50,),
//                       ),
//                     ),
//                  //   Gap(10),
//                  //    IconButton(icon:Icon(Icons.logout),onPressed: ()async{
//                  //      centralState!.logOut();
//                  //    },)
//                   ],
//                 ),
//                 Gap(20.h),
//                 Center(child: Text('${userController.patient!.firstName} ${userController.patient!.lastName}',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w600))),
//
//               ],
//             ),
//           ),
//          Gap(64.h),
//
//           ProfileDetailTile(description: userController.patient!.firstName,title: 'First name',),
//           Gap(16.h),
//           ProfileDetailTile(description: userController.patient!.lastName,title: 'Last name',),
//           Gap(16.h),
//           ProfileDetailTile(description: userController.patient!.email,title: 'Email address',),
//           Gap(16.h),
//           ProfileDetailTile(description: userController.patient!.gender,title: 'Gender',),
//           Gap(16.h),
//           ProfileDetailTile(description: userController.patient!.age,title: 'Age',),
//         ],
//       ),
//     ) ;
//   }
// }
//
// class ProfileDetailTile extends StatelessWidget {
//   final String? title;
//   final String? description;
//   const ProfileDetailTile({
//     Key? key,this.description,this.title
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 45.h,
//       width: 382.w,
//       padding: EdgeInsets.only(left: 18,top:
//       4),
//
//       decoration: BoxDecoration(color: AppTheme.white,borderRadius: BorderRadius.circular(5)),
//
//       child: Row(
//         children: [
//           Text('$title:',style:GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w600,),overflow: TextOverflow.ellipsis,),
//           Text(' $description',style:GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400))
//
//         ],
//       ),
//     );
//   }
// }
