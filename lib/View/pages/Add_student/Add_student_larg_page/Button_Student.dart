import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:get/get_rx/src/rx_types/rx_types.dart';import '../../../../help/Colors.dart';import '../../../../help/text_style.dart';import '../../controler/model.dart';class Button_Student extends StatelessWidget {  const Button_Student({    Key? key,    required this.changecolor,    required this.onPressed,    required this.text,  }) : super(key: key);  final bool changecolor;  final void Function() onPressed;  final String text;  @override  Widget build(BuildContext context) {    return Container(        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).devicePixelRatio + 5),        width: MediaQuery.of(context).size.width / 10,        height: MediaQuery.of(context).size.height / 14,        child: ElevatedButton(          style: ElevatedButton.styleFrom(            backgroundColor: changecolor == false                ? Colorsapp.SecondColor                : Colorsapp.mainColor,            shape:            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),          ),          onPressed: () {            onPressed();          },          child: Text(            text,            style: Text_Style.getstyle(                fontsize: MediaQuery.of(context).size.longestSide / 60,                ColorText: Colorsapp.White,                fontWeight: FontWeight.w800),          ),        ));  }}