import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'Add_student_larg_page/larg_page.dart';class Add_student_main_page extends StatefulWidget {  const Add_student_main_page({Key? key}) : super(key: key);  @override  State<Add_student_main_page> createState() => _Add_student_main_pageState();}class _Add_student_main_pageState extends State<Add_student_main_page> {  @override  @override  Widget build(BuildContext context) {    return      Stack(        children: [          Container(              height: MediaQuery.of(context).size.height,              width: MediaQuery.of(context).size.width,              decoration:  BoxDecoration(                image: MediaQuery.of(context).size.longestSide >1000?                const DecorationImage(image: AssetImage("photo/Webpage2.png"), fit: BoxFit.cover):                const DecorationImage(image: AssetImage("photo/Webpage1.png"), fit: BoxFit.cover),              ),            ),            const Add_student_larg_page(),        ],      );  }}