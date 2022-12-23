import 'dart:convert';import 'dart:typed_data';import 'package:dotted_border/dotted_border.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:flutter_dropzone/flutter_dropzone.dart';import 'dart:html' as html;import 'package:http/http.dart' as http;import '../../../../help/Colors.dart';import '../../../../help/text_style.dart';import '../../controler/model.dart';import 'Row_of_Button_stages.dart';class Add_Stages_larg_page extends StatefulWidget {  const Add_Stages_larg_page({Key? key}) : super(key: key);  @override  State<Add_Stages_larg_page> createState() => _Add_Stages_larg_pageState();}class _Add_Stages_larg_pageState extends State<Add_Stages_larg_page> {  upLodeFile() async {    html.FileUploadInputElement uplodeInput = html.FileUploadInputElement();    uplodeInput.multiple = true;    uplodeInput.draggable = true;    uplodeInput.click();    uplodeInput.onChange.listen((event) {      final files = uplodeInput.files;      final file = files![0];      final reader = html.FileReader();      reader.onLoadEnd.listen((event) {        setState(() {          Stages.bytesData1 =              Base64Decoder().convert(reader.result.toString().split(",").last);        });      });      reader.readAsDataUrl(file);    });  }  @override  Widget build(BuildContext context) {    return Row(      mainAxisAlignment: MainAxisAlignment.spaceBetween,      children: [        Padding(          padding: const EdgeInsets.only(left: 80),          child: Column(            mainAxisAlignment: MainAxisAlignment.spaceEvenly,            children: [              Text(                "اضافة مرحلة",                style: Text_Style.getstyle(                    fontsize:                    MediaQuery.of(context).size.longestSide / 30,                    ColorText: Colorsapp.mainColor,                    fontWeight: FontWeight.w700),              ),              GestureDetector(                  onDoubleTap: () async {                    print("ssssss");                    upLodeFile();                  },                  child: DottedBorder(                    dashPattern: [10, 4],                    strokeWidth: 2,                    color: Colorsapp.mainColor,                    strokeCap: StrokeCap.butt,                    borderType: BorderType.RRect,                    radius: Radius.circular(5),                    child: Container(                      width: MediaQuery.of(context).size.width / 2,                      height: MediaQuery.of(context).size.height / 5,                      color: Colorsapp.White,                      child: Stack(                        children: [                          buildZone1(context),                          Column(                            mainAxisAlignment: MainAxisAlignment.spaceAround,                            children: [                              Text(                                "ارفاق صورة",                                style: Text_Style.getstyle(                                    fontsize: MediaQuery.of(context).size.longestSide / 70,                                    ColorText: Colorsapp.mainColor,                                    fontWeight: FontWeight.w700),),                              Image.asset("photo/excel-file.png"),                              Center(child: Text(Stages.message3, style: Text_Style.getstyle(                                  fontsize: MediaQuery.of(context).size.longestSide / 70,                                  ColorText: Colorsapp.mainColor,                                  fontWeight: FontWeight.w500),)),                            ],                          ),                        ],                      ),                    ),                  )),              Stages.bytesData1 != null                  ? ClipRRect(                borderRadius: BorderRadius.circular(20),                child: Image.memory(                  Stages.bytesData1!,                  width: MediaQuery.of(context).size.width/3,                  height: MediaQuery.of(context).size.height/6,                ),              ) : Container(),              Text(                "اختيار المرحلة الدراسية ",                style: Text_Style.getstyle(                    fontsize:                    MediaQuery.of(context).size.longestSide / 40,                    ColorText: Colorsapp.mainColor,                    fontWeight: FontWeight.w700),              ),              Row_of_Button_stages(),              Container(                  width: MediaQuery.of(context).size.width / 5,                  height: MediaQuery.of(context).size.height / 10,                  child: ElevatedButton(                    style: ElevatedButton.styleFrom(                      backgroundColor: Colorsapp.SecondColor,                      shape: RoundedRectangleBorder(                          borderRadius: BorderRadius.circular(18)),                    ),                    onPressed: () {                      setState(() {});                      if (Stages.button_clicked_add_Stages[0] == true)                        print(Stages.stages[0]);                      if (Stages.button_clicked_add_Stages[1] == true)                        print(Stages.stages[1]);                      if (Stages.button_clicked_add_Stages[2] == true)                        print(Stages.stages[2]);                      if (Stages.button_clicked_add_Stages[3] == true)                        print(Stages.stages[3]);                    },                    child: Text(                      "ارسال",                      style: Text_Style.getstyle(                          fontsize:                          MediaQuery.of(context).size.longestSide /                              60,                          ColorText: Colorsapp.White,                          fontWeight: FontWeight.w800),                    ),                  )),            ],          ),        ),        if (MediaQuery.of(context).size.longestSide > 1000)          Image.asset(            "photo/1111.png",            width: MediaQuery.of(context).size.longestSide / 2.5,            height: MediaQuery.of(context).size.longestSide / 2.5,          ),      ],    );  }  Widget buildZone1(BuildContext context) => Builder(    builder: (context) => DropzoneView(      operation: DragOperation.copy,      cursor: CursorType.grab,      onCreated: (ctrl) => Stages.controller1 = ctrl,      onLoaded: () => print('Zone 1 loaded'),      onError: (ev) => print('Zone 1 error: $ev'),      onHover: () {        setState(() => Stages.highlighted1 = true);        print('Zone 1 hovered');      },      onLeave: () {        setState(() => Stages.highlighted1 = false);        print('Zone 1 left');      },      onDrop: (ev) async {        print('Zone 1 drop: ${ev.name}');        setState(() {          Stages.message3 = '${ev.name} '.substring(0,10);          Stages.highlighted1 = false;        });        final bytes = await Stages.controller1!.getFileData(ev);        print(bytes.runtimeType);        Stages.bytesData1 =bytes;      },      onDropMultiple: (ev) async {        print('Zone 1 drop multiple: $ev');      },    ),  );  Widget buildZone2(BuildContext context) => Builder(    builder: (context) => DropzoneView(      operation: DragOperation.move,      onCreated: (ctrl) => Stages.controller2 = ctrl,      onLoaded: () => print('Zone 2 loaded'),      onError: (ev) => print('Zone 2 error: $ev'),      onHover: () => print('Zone 2 hovered'),      onLeave: () => print('Zone 2 left'),      onDrop: (ev) {        print('Zone 2 drop: ${ev.name}');        setState(() {          Stages.message2 = '${ev.name} dropped';        });        final stream = Stages.controller2!.getFileStream(ev);        print(stream.take(20));      },      onDropMultiple: (ev) async {        print('Zone 2 drop multiple: $ev');      },    ),  );}