import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:notificationsystem/View/pages/controler/Routes.dart';

import 'package:notificationsystem/test.dart';
import 'package:notificationsystem/test2.dart';
import 'View/pages/Add_student/Add_student_main_page.dart';
import 'View/pages/FirstPage/first_main_page.dart';
import 'View/pages/Send_Schedules/Send_Schedules_main_page.dart';
import 'View/pages/Send_news/Send_news_main_page.dart';
import 'View/pages/Signin_page/Signin_main_page.dart';
import 'View/pages/add_stages/Add_stages.dart';
import 'help/Colors.dart';
import 'help/text_style.dart';
void main() {
  runApp(GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Notification System',
      //home: First_main_page(),
      //home: Send_news_main_page(),
      //home: test2(),
      //home: Schedules_main_page(),
      //home: Add_Stages_main_page(),
      defaultTransition: Transition.fadeIn,
      getPages: AppPages.pages,
      routerDelegate: AppRouterDelegate()
  ));;

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