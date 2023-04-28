import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:notificationsystem/controler/Routes.dart';

import 'View/pages/Post_Page/Post_Page_main_page.dart';
import 'controler/method.dart';

bool islogin=false;
void main()  async{
  print("--------------------------------main--------------------------------");

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAeFlMohXaNLIQ6Gv8JlFpI-8co2e0x7iA",
          authDomain: "notification-system-ac422.firebaseapp.com",
          projectId: "notification-system-ac422",
          storageBucket: "notification-system-ac422.appspot.com",
          messagingSenderId: "1022720436043",
          appId: "1:1022720436043:web:0a66294d42cbe467752ace",
          measurementId: "G-QMH0QSWJE2")
  );

  var user = FirebaseAuth.instance.currentUser;
  if(user == null){
    islogin=false;
    print("Email is not LOGIN");



  }else{
    islogin = true;
    print("Email is  LOGIN : ${FirebaseAuth.instance.currentUser?.email.toString()}");
  }


  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
        scrollBehavior: AppScrollBehavior(),

        debugShowCheckedModeBanner: false,
        title: 'Notification System',
        //home: First_main_page(),
        //home: Send_news_main_page(),
        //home: test2(),
        //home: Schedules_main_page(),
        //home: Add_Stages_main_page(),
        defaultTransition: Transition.fadeIn,
        getPages: AppPages.pages,
        routerDelegate: AppRouterDelegate());
  }
}

/////////////////////////////////////////
// void main() {
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Notification System',
//       //home: First_main_page(),
//       //home: Send_news_main_page(),
//       //home: test2(),
//       //home: Schedules_main_page(),
//       //home: Add_Stages_main_page(),
//       home: Add_student_main_page(),
//     );
//   }
// }