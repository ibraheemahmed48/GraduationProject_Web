import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:get/get_rx/src/rx_types/rx_types.dart';import '../../../../controler/model.dart';import '../../Send_Schedules/larg_page/Button_stages.dart';import 'Button_Student.dart';class Row_of_Button_Add_student extends StatefulWidget {  Row_of_Button_Add_student({    Key? key,  }) : super(key: key);  @override  State<Row_of_Button_Add_student> createState() =>      _Row_of_Button_Add_studentState();}class _Row_of_Button_Add_studentState extends State<Row_of_Button_Add_student> {  @override  Widget build(BuildContext context) {    return Row(      //      mainAxisAlignment: MainAxisAlignment.spaceBetween, //      crossAxisAlignment: CrossAxisAlignment.start, //      children: [        Button_Student(          changecolor: Stages.button_clicked_Add_student[0],          onPressed: () {            setState(() {});            if (Stages.button_clicked_Add_student[0] == false) {              Stages.button_clicked_Add_student[0] = true;              Stages.button_clicked_Add_student[1] = false;              Stages.button_clicked_Add_student[2] = false;              Stages.button_clicked_Add_student[3] = false;            } else {              Stages.button_clicked_Add_student[0] = false;            }          },          text: Stages.stages[0],        ),        Button_Student(          changecolor: Stages.button_clicked_Add_student[1],          onPressed: () {            setState(() {});            if (Stages.button_clicked_Add_student[1] == false) {              Stages.button_clicked_Add_student[0] = false;              Stages.button_clicked_Add_student[1] = true;              Stages.button_clicked_Add_student[2] = false;              Stages.button_clicked_Add_student[3] = false;            } else {              Stages.button_clicked_Add_student[1] = false;            }          },          text: Stages.stages[1],        ),        Button_Student(          changecolor: Stages.button_clicked_Add_student[2],          onPressed: () {            setState(() {});            if (Stages.button_clicked_Add_student[2] == false) {              Stages.button_clicked_Add_student[0] = false;              Stages.button_clicked_Add_student[1] = false;              Stages.button_clicked_Add_student[2] = true;              Stages.button_clicked_Add_student[3] = false;            } else {              Stages.button_clicked_Add_student[2] = false;            }          },          text: Stages.stages[2],        ),        Button_Student(          changecolor: Stages.button_clicked_Add_student[3],          onPressed: () {            setState(() {});            if (Stages.button_clicked_Add_student[3] == false) {              Stages.button_clicked_Add_student[0] = false;              Stages.button_clicked_Add_student[1] = false;              Stages.button_clicked_Add_student[2] = false;              Stages.button_clicked_Add_student[3] = true;            } else {              Stages.button_clicked_Add_student[3] = false;            }          },          text: Stages.stages[3],        ),      ],    );    //  }}