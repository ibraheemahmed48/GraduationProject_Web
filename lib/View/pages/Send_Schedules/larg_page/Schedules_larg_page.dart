import 'package:dotted_border/dotted_border.dart';import 'package:firebase_auth/firebase_auth.dart';import 'package:flutter/material.dart';import 'package:flutter_dropzone/flutter_dropzone.dart';import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';import 'dart:html' as html;import 'package:notificationsystem/controler/method.dart';import '../../../../controler/model.dart';import '../../../../help/Colors.dart';import '../../../../help/text_style.dart';import 'Column_OF_Button.dart';import 'Row_of_Button_stages.dart';import 'Schedules_TextField.dart';class Schedules_larg_page extends StatefulWidget {  const Schedules_larg_page({Key? key}) : super(key: key);  @override  State<Schedules_larg_page> createState() => _Schedules_larg_pageState();}class _Schedules_larg_pageState extends State<Schedules_larg_page> {  @override  DateTime Schedulestime = DateTime.now();  Widget build(BuildContext context) {    return Row(      mainAxisAlignment: MediaQuery.of(context).size.longestSide > 1000?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,      children: [        Padding(          padding:  EdgeInsets.only(left:MediaQuery.of(context).size.longestSide > 1000? 80:0),          child: ScrollConfiguration(            behavior:                ScrollConfiguration.of(context).copyWith(scrollbars: false),            child: SingleChildScrollView(                child: Column(              mainAxisAlignment: MainAxisAlignment.spaceEvenly,              children: [                Padding(                  padding: const EdgeInsets.only(top: 20),                  child: Text(                    "اضافة جدول",                    style: Text_Style.getstyle(                        fontsize: MediaQuery.of(context).size.longestSide / (MediaQuery.of(context).size.longestSide > 1000?30:25),                        ColorText: MediaQuery.of(context).size.longestSide > 1000?Colorsapp.mainColor:Colorsapp.White,                        fontWeight: FontWeight.w700),                  ),                ),                Padding(                  padding: const EdgeInsets.only(top: 20),                  child: Schedules_TextField(news: Stages.add_Schedules),                ),                Padding(                  padding: const EdgeInsets.all(8.0),                  child: Container(                    width: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.longestSide > 1000?2:1.2),                    height: 3,                    decoration: BoxDecoration(                        color: MediaQuery.of(context).size.longestSide > 1000?Colorsapp.mainColor:Colorsapp.White,                        borderRadius: BorderRadius.all(                          Radius.circular(10),                        ),                    ),                  ),                ),                Padding(                  padding: const EdgeInsets.only(top: 20),                  child: Container(                    //width: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.longestSide > 1000?1.5:1.1),                      decoration: BoxDecoration(                          color: Colorsapp.TextColor.withOpacity(0.5),                          borderRadius: BorderRadius.circular(20)                      ),                      child: Row(                        mainAxisAlignment: MainAxisAlignment.center,                    children: [                      GestureDetector(                          onDoubleTap: () async {                            print("ssssss");                            print("11111111111111${Stages.urlSchedulesImage}");                            await Methods.upLodeImageSchedules(                                text: "Schedules");                            print("2222222222222${Stages.urlSchedulesImage}");                          },                          child: DottedBorder(                            dashPattern: [10, 4],                            strokeWidth: 2,                            color: MediaQuery.of(context).size.longestSide > 1000?Colorsapp.mainColor:Colorsapp.White,                            strokeCap: StrokeCap.butt,                            borderType: BorderType.RRect,                            radius: Radius.circular(5),                            child: Container(                              width: MediaQuery.of(context).size.width / 3,                              height: 120,                              color: Colorsapp.White,                              child: Stack(                                children: [                                  buildZone1(context),                                  Column(                                    mainAxisAlignment:                                        MainAxisAlignment.spaceAround,                                    children: [                                      Text(                                        "ارفاق صورة",                                        style: Text_Style.getstyle(                                            fontsize: MediaQuery.of(context)                                                    .size                                                    .longestSide /                                                70,                                            ColorText: Colorsapp.mainColor,                                            fontWeight: FontWeight.w700),                                      ),                                      Center(                                          child: Text(                                        Stages.message1,                                        style: Text_Style.getstyle(                                            fontsize: MediaQuery.of(context)                                                    .size                                                    .longestSide /                                                70,                                            ColorText: Colorsapp.mainColor,                                            fontWeight: FontWeight.w500),                                      )),                                    ],                                  ),                                ],                              ),                            ),                          )),                      Padding(                        padding: const EdgeInsets.only(left: 0),                        child: Container(                          width: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.longestSide > 1000?6:3),                          height: 250,                          child: Column_OF_Button(),                        ),                      ),                    ],                  ))                ),                ////////////////////////////////////////                Padding(                  padding: const EdgeInsets.all(8.0),                  child: Obx(() {                    return Stages.flagsSchedules1.value == true                        ? Container(                            decoration: BoxDecoration(                              color: Colorsapp.Container_post,                              borderRadius: BorderRadius.circular(15),                              border: Border.all(                                color: Colorsapp.mainColor,                                width: 2,                              ),                            ),                            //width: MediaQuery.of(context).size.width/5,                            height: MediaQuery.of(context).size.height /4,                            child: ClipRRect(                                borderRadius: BorderRadius.circular(15),                                child: Image.network(                                  Stages.urlSchedulesImage,                                  fit: BoxFit.contain,                                )))                        : Container();                  }),                ),                ///////////////////////                Padding(                  padding: const EdgeInsets.all(8.0),                  child: Container(                    width: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.longestSide > 1000?2:1.2),                    height: 3,                    decoration: BoxDecoration(                      color: MediaQuery.of(context).size.longestSide > 1000?Colorsapp.mainColor:Colorsapp.White,                      borderRadius: BorderRadius.all(                        Radius.circular(10),                      ),                    ),                  ),                ),                Padding(                  padding: const EdgeInsets.only(top: 10),                  child: Text(                    "اختيار المرحلة الدراسية ",                    style: Text_Style.getstyle(                        fontsize: MediaQuery.of(context).size.longestSide / (MediaQuery.of(context).size.longestSide > 1000?40:30),                        ColorText: MediaQuery.of(context).size.longestSide > 1000?Colorsapp.mainColor:Colorsapp.White,                        fontWeight: FontWeight.w700),                  ),                ),                Row_of_Button_stages(),                Padding(                  padding: const EdgeInsets.only(top: 20, bottom: 30),                  child: Container(                      width:MediaQuery.of(context).size.width / (MediaQuery.of(context).size.longestSide > 1000?5:4),                      height: 60,                      child: ElevatedButton(                        style: ElevatedButton.styleFrom(                          backgroundColor: Colorsapp.greenColor,                          shape: RoundedRectangleBorder(                              borderRadius: BorderRadius.circular(18)),                        ),                        onPressed: () async {                          Stages.CircularProgressflag.value = true;                          Future.delayed(const Duration(seconds: 2),                                  () async {                                print("-------------------------------");                                Stages.CircularProgressflag.value = false;                                //html.window.location.reload();                              });                          if (Stages.button_clicked_Schedules[0] == true) {                            print(Stages.stages[0]);                            Stages.Uplode_Schedules_stages=Stages.stagesUplode[0];                            Stages.stagesSchedules = Stages.stages[0];                          }                          if (Stages.button_clicked_Schedules[1] == true) {                            Stages.stagesSchedules = Stages.stages[1];                            Stages.Uplode_Schedules_stages=Stages.stagesUplode[1];                            print(Stages.stages[1]);                          }                          if (Stages.button_clicked_Schedules[2] == true) {                            print(Stages.stages[2]);                            Stages.stagesSchedules = Stages.stages[2];                            Stages.Uplode_Schedules_stages=Stages.stagesUplode[2];                          }                          if (Stages.button_clicked_Schedules[3] == true) {                            print(Stages.stages[3]);                            Stages.stagesSchedules = Stages.stages[3];                            Stages.Uplode_Schedules_stages=Stages.stagesUplode[3];                          }                          if (Stages.urlSchedulesImage.isEmpty) {                            Methods.showAlerterror(context, "لا يوجد صورة");                          } else if (Stages.typeofSchedules.isEmpty) {                            Methods.showAlerterror(                                context, "لا يوجد نوع الجدول");                          }else if (Stages.stagesSchedules.isEmpty) {                            Methods.showAlerterror(                                context, "لم يتم تحديد مرحلة");                          } else {                            await Methods.AddSchedules(                              title: Stages.add_Schedules.text,                              image1: await Stages.urlSchedulesImage,                              auther: FirebaseAuth.instance.currentUser                                  ?.displayName != null                                  ? "${FirebaseAuth.instance.currentUser                                  ?.displayName}"                                  : "User",                              stage: Stages.stagesSchedules,                              type: Stages.typeofSchedules,                            );                            if (Stages.flagsScheduleserror.value == false) {                              await Future.delayed(const Duration(seconds: 2), () async {                                    print("-------------------------------");                                    print(                                        "////////////////ppppppppppppppp//////////////////////////////");                                    print(                                        "Stages.Uplode_Schedules_stages: ${Stages.Uplode_Schedules_stages}");                                      print("stagesNewsUplode: ${Stages.Uplode_Schedules_stages}");                                      await Methods.getAllTokensFromFirestore(stage: Stages.Uplode_Schedules_stages);                                      for(int j =0;j<Methods.tokenList.length;j++){                                        print("Token ${Stages.Uplode_Schedules_stages}: ${Methods.tokenList[j]["Token"]}");                                        await Methods.sendNotification(                                            title: FirebaseAuth.instance.currentUser                                                ?.displayName!,                                            body1: Stages.typeofSchedules,                                            fcmToken: Methods.tokenList[j]["Token"],                                            time: '${Methods.todaySchedules}'                                        );                                      }                                    Methods.showAlertDONE(context, "تم الاضافة بنجاح");                                    await Future.delayed(Duration(seconds: 2),(){                                      html.window.location.reload();                                    });                                    print("-------------------------------");                                  });                            }else if (Stages.flagsScheduleserror.value == true) {                                Methods.showAlerterror(context, "لم يتم الاضافة");                              }                          }                        },                        child: Padding(                          padding: const EdgeInsets.only(top: 5),                          child: Obx(() {                            return Stages.CircularProgressflag.value == false                                ? Text(                                    "أضافة",                              style: Text_Style.getstyle(                                  fontsize:                                  MediaQuery.of(context)                                      .size                                      .longestSide / (MediaQuery.of(context).size.longestSide > 1000?60:40),                                  ColorText: Colors.black,                                  fontWeight:                                  FontWeight.w800),                                  )                                : CircularProgressIndicator(                                    color: Colorsapp.mainColor,                                  );                          }),                        ),                      )),                ),              ],            )),          ),        ),        if (MediaQuery.of(context).size.longestSide > 1000)          Image.asset(            "photo/1111.png",            width: MediaQuery.of(context).size.longestSide / 2.5,            height: MediaQuery.of(context).size.longestSide / 2.5,          ),      ],    );  }  Widget buildZone1(BuildContext context) => Builder(        builder: (context) => DropzoneView(          operation: DragOperation.copy,          cursor: CursorType.grab,          onCreated: (ctrl) => Stages.controller1 = ctrl,          onLoaded: () => print('Zone 1 loaded'),          onError: (ev) => print('Zone 1 error: $ev'),          onHover: () {            setState(() => Stages.highlighted1 = true);            print('Zone 1 hovered');          },          onLeave: () {            setState(() => Stages.highlighted1 = false);            print('Zone 1 left');          },          onDrop: (ev) async {            print('Zone 1 drop: ${ev.name}');            setState(() {              Stages.message1 = '${ev.name} '.substring(0, 10);              Stages.highlighted1 = false;            });            final bytes = await Stages.controller1!.getFileData(ev);            print(bytes.runtimeType);            Stages.bytesData1 = bytes;          },          onDropMultiple: (ev) async {            print('Zone 1 drop multiple: $ev');          },        ),      );  Widget buildZone2(BuildContext context) => Builder(        builder: (context) => DropzoneView(          operation: DragOperation.move,          onCreated: (ctrl) => Stages.controller2 = ctrl,          onLoaded: () => print('Zone 2 loaded'),          onError: (ev) => print('Zone 2 error: $ev'),          onHover: () => print('Zone 2 hovered'),          onLeave: () => print('Zone 2 left'),          onDrop: (ev) {            print('Zone 2 drop: ${ev.name}');            setState(() {              Stages.message2 = '${ev.name} dropped';            });            final stream = Stages.controller2!.getFileStream(ev);            print(stream.take(20));          },          onDropMultiple: (ev) async {            print('Zone 2 drop multiple: $ev');          },        ),      );}