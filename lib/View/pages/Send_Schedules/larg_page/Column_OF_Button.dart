import 'package:flutter/cupertino.dart';import '../../../../controler/model.dart';import 'Schedules_Alignment_Button.dart';class Column_OF_Button extends StatefulWidget {  const Column_OF_Button({Key? key}) : super(key: key);  @override  State<Column_OF_Button> createState() => _Column_OF_ButtonState();}class _Column_OF_ButtonState extends State<Column_OF_Button> {  @override  Widget build(BuildContext context) {    return Column(      children: [        Schedules_Alignment_Button(          MainAxisAlignment1: MainAxisAlignment.center,          text1: 'جدول امتحان',          text2: 'الفصلي',          changecolor: Stages.button_clicked_type[0],          onPressed: () {            Stages.typeofSchedules = "جدول امتحان الفصلي";            setState(() {});            if (Stages.button_clicked_type[0] == false) {              Stages.button_clicked_type[0] = true;              Stages.button_clicked_type[1] = false;              Stages.button_clicked_type[2] = false;            } else {              Stages.button_clicked_type[0] = false;            }          },        ),        Schedules_Alignment_Button(          MainAxisAlignment1: MainAxisAlignment.end,          text1: 'جدول امتحان',          text2: 'الشهري',          changecolor: Stages.button_clicked_type[1],          onPressed: () {            Stages.typeofSchedules = "جدول امتحان الشهري";            setState(() {});            if (Stages.button_clicked_type[1] == false) {              Stages.button_clicked_type[0] = false;              Stages.button_clicked_type[1] = true;              Stages.button_clicked_type[2] = false;            } else {              Stages.button_clicked_type[1] = false;            }          },        ),        Schedules_Alignment_Button(          MainAxisAlignment1: MainAxisAlignment.center,          text1: 'جدول الدوام',          text2: 'الاسبوعي',          changecolor: Stages.button_clicked_type[2],          onPressed: () {            Stages.typeofSchedules = "جدول الدوام الاسبوعي";            setState(() {});            if (Stages.button_clicked_type[2] == false) {              Stages.button_clicked_type[0] = false;              Stages.button_clicked_type[1] = false;              Stages.button_clicked_type[2] = true;            } else {              Stages.button_clicked_type[2] = false;            }          },        ),      ],    );  }}