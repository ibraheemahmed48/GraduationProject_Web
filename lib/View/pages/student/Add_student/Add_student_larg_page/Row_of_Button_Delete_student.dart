import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:get/get_rx/src/rx_types/rx_types.dart';import 'package:notificationsystem/controler/method.dart';import '../../../../../controler/model.dart';import 'Button_Student.dart';class button_clicked_Delete_student extends StatefulWidget {  button_clicked_Delete_student({    Key? key,  }) : super(key: key);  static final RxString typed_news = ''.obs;  @override  State<button_clicked_Delete_student> createState() => _button_clicked_Delete_studentState();}class _button_clicked_Delete_studentState extends State<button_clicked_Delete_student> {  @override  Widget build(BuildContext context) {    return Row(      //      mainAxisAlignment: MainAxisAlignment.spaceBetween, //      crossAxisAlignment: CrossAxisAlignment.start, //      children:[        Button_Student(          changecolor: Stages.button_clicked_Delete_student[0],          onPressed: () {            setState(() {});            if (Stages.button_clicked_Delete_student[0] == false) {              Methods.deleteStages=Stages.stagesUplode[0];              Methods.deleteStudent=Stages.stagesUplode[0];              Stages.button_clicked_Delete_student[0] = true;              Stages.button_clicked_Delete_student[1] = false;              Stages.button_clicked_Delete_student[2] = false;              Stages.button_clicked_Delete_student[3] = false;            } else {              Stages.button_clicked_Delete_student[0] = false;            }          },          text: Stages.stages[0],        ),        Button_Student(          changecolor: Stages.button_clicked_Delete_student[1],          onPressed: () {            setState(() {});            if (Stages.button_clicked_Delete_student[1] == false) {              Methods.deleteStages=Stages.stagesUplode[1];              Methods.deleteStudent=Stages.stagesUplode[1];              Stages.button_clicked_Delete_student[0] = false;              Stages.button_clicked_Delete_student[1] = true;              Stages.button_clicked_Delete_student[2] = false;              Stages.button_clicked_Delete_student[3] = false;            } else {              Stages.button_clicked_Delete_student[1] = false;            }          },          text: Stages.stages[1],        ),        Button_Student(          changecolor: Stages.button_clicked_Delete_student[2],          onPressed: () {            setState(() {});            if (Stages.button_clicked_Delete_student[2] == false) {              Methods.deleteStages=Stages.stagesUplode[2];              Methods.deleteStudent=Stages.stagesUplode[2];              Stages.button_clicked_Delete_student[0] = false;              Stages.button_clicked_Delete_student[1] = false;              Stages.button_clicked_Delete_student[2] = true;              Stages.button_clicked_Delete_student[3] = false;            } else {              Stages.button_clicked_Delete_student[2] = false;            }          },          text: Stages.stages[2],        ),        Button_Student(          changecolor: Stages.button_clicked_Delete_student[3],          onPressed: () {            setState(() {});            if (Stages.button_clicked_Delete_student[3] == false) {              Methods.deleteStages=Stages.stagesUplode[3];              Methods.deleteStudent=Stages.stagesUplode[3];              Stages.button_clicked_Delete_student[0] = false;              Stages.button_clicked_Delete_student[1] = false;              Stages.button_clicked_Delete_student[2] = false;              Stages.button_clicked_Delete_student[3] = true;            } else {              Stages.button_clicked_Delete_student[3] = false;            }          },          text: Stages.stages[3],        ),      ],    );    //  }}