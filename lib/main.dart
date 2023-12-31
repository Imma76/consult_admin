import 'package:bot_toast/bot_toast.dart';
import 'package:consult_admin/src/all_providers/all_providers.dart';
import 'package:consult_admin/src/themes/app_theme.dart';
import 'package:consult_admin/src/utils/widgets/loader.dart';
import 'package:consult_admin/src/views/authentication/login.dart';
import 'package:consult_admin/src/views/home/home_page.dart';

//import 'package:device_preview/device_preview.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    //DevicePreview(
    //enabled: !kReleaseMode,

    //builder :(context)=>
      const MyApp()
    //)
  );
}

final botToastBuilder = BotToastInit();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) {
          return ProviderScope(
            child: MaterialApp(
              navigatorKey: navigatorKey,
              title: 'Consultant patient',
             // routes:routes,
              debugShowCheckedModeBanner: false,
              navigatorObservers: [BotToastNavigatorObserver()],
              builder: BotToastInit(),
              //builder: DevicePreview.appBuilder,
              home: LoadApp(),
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              //home: const MyHomePage(title: 'Flutter Demo Home Page'),
            ),
          );
        }

    );
  }
}


class LoadApp extends ConsumerStatefulWidget {
  const LoadApp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoadAppState();
}

class _LoadAppState extends ConsumerState<LoadApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(centralProvider).initializeApp();

  }
  @override
  Widget build(BuildContext context) {
    final centralController = ref.watch(centralProvider);
    if(centralController.isAppLoading) {
      return Scaffold(
          backgroundColor: AppTheme.lightGreen,
          body:Indicator2());
    }
    if(centralController.isUserPresent){
      return HomePage();
    }


    return LoginScreen();

  }
}



//
// class LoadApp extends ConsumerWidget {
//   const LoadApp({
//     Key? key,
//   }) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//
//     return Consumer(
//       builder: (context, widget,ref){
//         if(centralState.isUserPresent){
//          return Homepage();
//        }
//         return WelcomeScreen();
//       },
//     );
//   }
// }