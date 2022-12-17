import 'package:flutter/material.dart';

import 'package:notificationsystem/test.dart';
import 'package:notificationsystem/test2.dart';
import 'View/pages/Send_Schedules/Send_Schedules_main_page.dart';
import 'View/pages/Send_news/Send_news_main_page.dart';
import 'help/Colors.dart';
import 'help/text_style.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notification System',
      //home: First_main_page(),
      //home: Send_news_main_page(),
    //home: Signin_main_page(),
      //home: test2(),
     home: Schedules_main_page(),
    );
  }
}

