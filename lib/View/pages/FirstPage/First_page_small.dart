import 'package:flutter/cupertino.dart';import 'package:get/get.dart';import '../../../help/Colors.dart';import '../../../help/text_style.dart';import 'Home_Button_small.dart';class First_page_small extends StatelessWidget {  const First_page_small({    Key? key,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return Row(      mainAxisAlignment: MainAxisAlignment.center,      children: [        Column(          mainAxisAlignment: MainAxisAlignment.spaceAround,          crossAxisAlignment: CrossAxisAlignment.center,          children: [            Image.asset(              "photo/1111.png",              width: MediaQuery.of(context).size.longestSide / 2.5,              height: MediaQuery.of(context).size.longestSide / 2.5,            ),            Text(              "ادارة القسم",              style: Text_Style.getstyle(                  fontsize: MediaQuery.of(context).size.longestSide / 20,                  ColorText: Colorsapp.White,                  fontWeight: FontWeight.w700),            ),            Home_Button_small(Text_Button: 'ارسال خبر ', onPressed: () {  }, X: 30.obs,),            Home_Button_small(Text_Button: 'اضافة طالب', onPressed: () {  }, X: 30.obs,),            Home_Button_small(Text_Button: 'اضافة طلاب', onPressed: () {  }, X: 30.obs,),            Home_Button_small(Text_Button: 'اضافة جدول', onPressed: () {  }, X: 30.obs,),            Home_Button_small(Text_Button: 'المنشورات', onPressed: () {  }, X: 30.obs,),          ],        ),      ],    );  }}