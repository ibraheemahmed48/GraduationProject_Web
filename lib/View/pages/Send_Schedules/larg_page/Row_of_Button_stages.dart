import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:get/get_rx/src/rx_types/rx_types.dart';import '../../../../controler/model.dart';import 'Button_stages.dart';class Row_of_Button_stages extends StatefulWidget {  Row_of_Button_stages({    Key? key,  }) : super(key: key);  static final RxString typed_news = ''.obs;  @override  State<Row_of_Button_stages> createState() => _Row_of_Button_stagesState();}class _Row_of_Button_stagesState extends State<Row_of_Button_stages> {  @override  Widget build(BuildContext context) {    return Row(        //        mainAxisAlignment: MainAxisAlignment.spaceBetween, //        crossAxisAlignment: CrossAxisAlignment.start, //        children:[          Button_stages(            changecolor: Stages.button_clicked_Schedules[0],            onPressed: () {              setState(() {});              if (Stages.button_clicked_Schedules[0] == true) {                Stages.button_clicked_Schedules[0] = false;              } else {                Stages.button_clicked_Schedules[0] = true;              }            },            text: Stages.stages[0],          ),          Button_stages(            changecolor: Stages.button_clicked_Schedules[1],            onPressed: () {              setState(() {});              if (Stages.button_clicked_Schedules[1] == true) {                Stages.button_clicked_Schedules[1] = false;              } else {                Stages.button_clicked_Schedules[1] = true;              }            },            text: Stages.stages[1],          ),          Button_stages(            changecolor: Stages.button_clicked_Schedules[2],            onPressed: () {              setState(() {});              if (Stages.button_clicked_Schedules[2] == true) {                Stages.button_clicked_Schedules[2] = false;              } else {                Stages.button_clicked_Schedules[2] = true;              }            },            text: Stages.stages[2],          ),          Button_stages(            changecolor: Stages.button_clicked_Schedules[3],            onPressed: () {              setState(() {});              if (Stages.button_clicked_Schedules[3] == true) {                Stages.button_clicked_Schedules[3] = false;              } else {                Stages.button_clicked_Schedules[3] = true;              }            },            text: Stages.stages[3],          ),],    );    //  }}