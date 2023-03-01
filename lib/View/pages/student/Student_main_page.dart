import 'dart:ui';import 'package:email_validator/email_validator.dart';import 'package:firebase_auth/firebase_auth.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:get/get.dart';import 'package:get/get_rx/src/rx_types/rx_types.dart';import 'package:google_sign_in/google_sign_in.dart';import '../../../controler/method.dart';import '../../../help/Colors.dart';import '../FirstPage/First_page_large.dart';import '../FirstPage/First_page_small.dart';import '../FirstPage/Home_Button_big.dart';import 'Add_student/Add_student_small_page/Add_student_main_page.dart';import 'View_Student/Student.dart';import 'add_stages/Add_stages.dart';class Student_main_page extends StatefulWidget {  Student_main_page({Key? key}) : super(key: key);  @override  State<Student_main_page> createState() => _Student_main_pageState();}class _Student_main_pageState extends State<Student_main_page> {  @override  void initState() {    super.initState();  }  @override  Widget build(BuildContext context) {    final PageController controller = PageController(initialPage:2);    return Scaffold(        body: PageView(          /// [PageView.scrollDirection] defaults to [Axis.horizontal].          /// Use [Axis.vertical] to scroll vertically.          scrollDirection: Axis.horizontal,          controller: controller,          children: const <Widget>[            Add_Stages_main_page(),            Add_student_main_page(),            View_Student()          ],        ));  }}class AppScrollBehavior extends MaterialScrollBehavior {  @override  Set<PointerDeviceKind> get dragDevices => {    PointerDeviceKind.touch,    PointerDeviceKind.mouse,  };}/*MediaQuery.of(context).size.longestSide > 1000?            Container(              height: MediaQuery.of(context).size.height,              width: MediaQuery.of(context).size.width,              decoration: const BoxDecoration(                image: DecorationImage(                    image: AssetImage("photo/Webpage6.png"), fit: BoxFit.cover),              ),              child:Post_larg_Page(),            ):            Container(              height: MediaQuery.of(context).size.height,              width: MediaQuery.of(context).size.width,              decoration: const BoxDecoration(                image: DecorationImage(                    image: AssetImage("Webpage222.png"), fit: BoxFit.cover),              ),              child:  Post_small_Page(),            ), */