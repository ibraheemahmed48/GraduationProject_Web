import 'package:flutter/cupertino.dart';import '../../../../controler/model.dart';import '../larg_page/Button_stages.dart';import 'Button_stages_small.dart';class Row_of_Button_stages_Small extends StatefulWidget {  const Row_of_Button_stages_Small({Key? key}) : super(key: key);  @override  State<Row_of_Button_stages_Small> createState() => _Row_of_Button_stages_SmallState();}class _Row_of_Button_stages_SmallState extends State<Row_of_Button_stages_Small> {  @override  Widget build(BuildContext context) {    return Row(      //        mainAxisAlignment: MainAxisAlignment.spaceBetween, //        crossAxisAlignment: CrossAxisAlignment.start, //        children: [          Button_stages_small(            changecolor: Stages.button_clicked_Schedules[0],            onPressed: () {              setState(() {});              if (Stages.button_clicked_Schedules[0] == true) {                Stages.button_clicked_Schedules[0] = false;              } else {                Stages.button_clicked_Schedules[0] = true;              }            },            text: Stages.stages[0],          ),          Button_stages_small(            changecolor: Stages.button_clicked_Schedules[1],            onPressed: () {              setState(() {});              if (Stages.button_clicked_Schedules[1] == true) {                Stages.button_clicked_Schedules[1] = false;              } else {                Stages.button_clicked_Schedules[1] = true;              }            },            text: Stages.stages[1],          ),          Button_stages_small(            changecolor: Stages.button_clicked_Schedules[2],            onPressed: () {              setState(() {});              if (Stages.button_clicked_Schedules[2] == true) {                Stages.button_clicked_Schedules[2] = false;              } else {                Stages.button_clicked_Schedules[2] = true;              }            },            text: Stages.stages[2],          ),          Button_stages_small(            changecolor: Stages.button_clicked_Schedules[3],            onPressed: () {              setState(() {});              if (Stages.button_clicked_Schedules[3] == true) {                Stages.button_clicked_Schedules[3] = false;              } else {                Stages.button_clicked_Schedules[3] = true;              }            },            text: Stages.stages[3],          ),        ]);  }}