import 'dart:convert';import 'package:dotted_border/dotted_border.dart';import 'package:firebase_auth/firebase_auth.dart';import 'package:firebase_storage/firebase_storage.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:get/get.dart';import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';import 'dart:html' as html;import 'package:notificationsystem/controler/method.dart';import '../../../../controler/model.dart';import '../../../../help/Colors.dart';import '../../../../help/text_style.dart';import '../../Add_student/Add_student_larg_page/TextField_Add_student1.dart';import 'Row_of_Button_stages.dart';import 'Send_news_TextField.dart';import 'dart:async';import 'dart:io';class Send_news_larg_page extends StatefulWidget {  const Send_news_larg_page({Key? key}) : super(key: key);  @override  State<Send_news_larg_page> createState() => _Send_news_larg_pageState();}class _Send_news_larg_pageState extends State<Send_news_larg_page> {  upLodeFile() async {    html.FileUploadInputElement uploadedInput = html.FileUploadInputElement();    uploadedInput.multiple = true;    uploadedInput.draggable = true;    uploadedInput.click();    uploadedInput.onChange.listen((event) {      final files = uploadedInput.files;      final file = files![0];      final reader = html.FileReader();      reader.onLoadEnd.listen((event) {        setState(() {          Stages.bytesData1 = const Base64Decoder()              .convert(reader.result.toString().split(",").last);        });      });      reader.readAsDataUrl(file);    });    print("-------------------------------");    print(Stages.bytesData1);    print("-------------------------------");    Future.delayed(const Duration(seconds: 3), () async {      print("-------------------------------");      File ss = File.fromRawPath(Stages.bytesData1!);      //print("*************************** ${ss}");      var ref = FirebaseStorage.instance.ref("images/");      await ref.putFile(ss);      var url = ref.getDownloadURL();      print("url : $url");      print("-------------------------------");    });  }  @override  void initState() {    // TODO: implement initState  }  Widget build(BuildContext context) {    return Row(      mainAxisAlignment: MainAxisAlignment.spaceBetween,      children: [        Padding(          padding: const EdgeInsets.only(left: 60),          child: Padding(            padding: const EdgeInsets.all(8.0),            child: MediaQuery.of(context).size.height > 150                ? Container(                    height: MediaQuery.of(context).size.height,                    child: ScrollConfiguration(                        behavior: ScrollConfiguration.of(context)                            .copyWith(scrollbars: false),                        child: SingleChildScrollView(                          child: Column(                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,                            children: [                              Padding(                                padding: const EdgeInsets.only(top: 10),                                child: Text(                                  "ارسال خبر",                                  style: Text_Style.getstyle(                                      fontsize: MediaQuery.of(context)                                              .size                                              .longestSide /                                          30,                                      ColorText: Colorsapp.mainColor,                                      fontWeight: FontWeight.w700),                                ),                              ),                              Padding(                                padding: const EdgeInsets.only(top: 30),                                child: Row(                                  children: [                                    Obx(() {                                      return TextField_Add_Student(                                        typed_email: Stages.typed_title,                                        Email: Stages.news_title,                                        text: '',                                        width1: 2.5,                                        icon: Icon((Icons.title),                                            color:                                                Stages.typed_Link.value.isEmpty                                                    ? Colors.black                                                    : Colorsapp.mainColor),                                        maxline: 1,                                        onChanged: (text1) {                                          Stages.typed_Link.value = text1;                                        },                                        pass: false,                                        margin_left: 0,                                      );                                    }),                                    Container(                                      height: 55,                                      padding: const EdgeInsets.only(top: 5),                                      child: Text(                                        " :العنوان ",                                        style: Text_Style.getstyle(                                            fontsize: 18,                                            ColorText: Colorsapp.mainColor,                                            fontWeight: FontWeight.w800),                                      ),                                    ),                                  ],                                ),                              ),                              Padding(                                padding: const EdgeInsets.only(top: 20),                                child: Send_news_TextField(news: Stages.news1),                              ),                              Padding(                                padding: const EdgeInsets.only(top: 30),                                child: Row(                                  children: [                                    Obx(() {                                      return TextField_Add_Student(                                        typed_email: Stages.typed_Link,                                        Email: Stages.news_Link,                                        text: '',                                        width1: 2.5,                                        icon: Icon((Icons.alternate_email),                                            color:                                                Stages.typed_Link.value.isEmpty                                                    ? Colors.black                                                    : Colorsapp.mainColor),                                        maxline: 1,                                        onChanged: (text1) {                                          Stages.typed_Link.value = text1;                                        },                                        pass: false,                                        margin_left: 0,                                      );                                    }),                                    Container(                                      height: 55,                                      padding: const EdgeInsets.only(top: 5),                                      child: Text(                                        " :اضافة رابط ",                                        style: Text_Style.getstyle(                                            fontsize: 18,                                            ColorText: Colorsapp.mainColor,                                            fontWeight: FontWeight.w800),                                      ),                                    ),                                  ],                                ),                              ),                              GestureDetector(                                  onDoubleTap: () async {                                    print("11111111111111${Stages.urlNewsImage}");                                    await Methods.upLodeImagesnew(text: "news");                                    print("2222222222222${Stages.urlNewsImage}");                                  },                                  child: DottedBorder(                                    dashPattern: [10, 4],                                    strokeWidth: 2,                                    color: Colorsapp.mainColor,                                    strokeCap: StrokeCap.butt,                                    borderType: BorderType.RRect,                                    radius: Radius.circular(5),                                    child: Container(                                      width:                                          MediaQuery.of(context).size.width / 3,                                      height: 130,                                      child: Stack(                                        children: [                                         // buildZone51(context),                                          Column(                                            mainAxisAlignment:                                                MainAxisAlignment.spaceAround,                                            children: [                                              Text(                                                "ارفاق صورة",                                                style: Text_Style.getstyle(                                                    fontsize:                                                        MediaQuery.of(context)                                                                .size                                                                .height /                                                            30,                                                    ColorText:                                                        Colorsapp.mainColor,                                                    fontWeight:                                                        FontWeight.w700),                                              ),                                              Center(                                                  child: Text(                                                Stages.message1,                                                style: Text_Style.getstyle(                                                    fontsize:                                                        MediaQuery.of(context)                                                                .size                                                                .height /                                                            40,                                                    ColorText:                                                        Colorsapp.mainColor,                                                    fontWeight:                                                        FontWeight.w500),                                              )),                                            ],                                          ),                                        ],                                      ),                                    ),                                  )                              ),                                  Padding(                                    padding: const EdgeInsets.all(8.0),                                    child: Obx(                                      () {                                        return  Stages.flagsNews.value== true?Container(                                          decoration: BoxDecoration(                                              color: Colorsapp.Container_post,                                              borderRadius: BorderRadius.circular(15)                                          ),                                          width: MediaQuery.of(context).size.width/2,                                          height: MediaQuery.of(context).size.height/5,                                          child: ListView.builder(                                            itemCount: Stages.ListOFurlNewsImage.length,                                            scrollDirection: Axis.horizontal,                                            itemBuilder: (BuildContext context, int index) {                                              return Padding(                                                padding: const EdgeInsets.all(4.0),                                                child: Container(                                                  decoration: BoxDecoration(                                                    color: Colorsapp.White,                                                    border: Border.all(                                                      color: Colorsapp.mainColor,                                                      width: 2,                                                    ) ,                                                    borderRadius: BorderRadius.circular(15),                                                  ) ,                                                  child: GestureDetector(                                                    onTap: (){                                                      setState(() {                                                      });                                                      print("*****************************");                                                      print(Stages.ListOFurlNewsImage[index]);                                                      print(Stages.ListOFurlNewsImage.indexOf(index));                                                    },                                                    child: ClipRRect(                                                        borderRadius: BorderRadius.circular(15),                                                        child: Image.network(                                                          Stages.ListOFurlNewsImage[index],                                                          fit: BoxFit.contain,                                                        )),                                                  ),                                                ),                                              );                                            },                                          ),                                        ):  Stages.ListOFurlNewsImage.isNotEmpty? Container(                                            decoration: BoxDecoration(                                                color: Colorsapp.Container_post,                                                borderRadius: BorderRadius.circular(15),                                            ),                                           width: MediaQuery.of(context).size.width/2,                                            height: MediaQuery.of(context).size.height/5,                                            child:ListView.builder(                                              itemCount: Stages.ListOFurlNewsImage.length,                                              scrollDirection: Axis.horizontal,                                              itemBuilder: (BuildContext context, int index) {                                                return Padding(                                                  padding: const EdgeInsets.all(4.0),                                                  child: Container(                                                    decoration: BoxDecoration(                                                      color: Colorsapp.White,                                                      border: Border.all(                                                        color: Colorsapp.mainColor,                                                        width: 2,                                                      ) ,                                                      borderRadius: BorderRadius.circular(15),                                                    ) ,                                                    child: GestureDetector(                                                        onTap: (){                                                          setState(() {                                                          });                                                          print("*****************************");                                                          print(Stages.ListOFurlNewsImage[index]);                                                          print(Stages.ListOFurlNewsImage.indexOf(index));                                                        },                                                        child: ClipRRect(                                                        borderRadius: BorderRadius.circular(15),                                                        child: Image.network(                                                          Stages.ListOFurlNewsImage[index],                                                          fit: BoxFit.contain,                                                        ))),                                                  ),                                                );                                              },                                            )                                        ):Container();                                      }                                    ),                                  ),                              Padding(                                padding: const EdgeInsets.only(top: 30),                                child: Text(                                  "اختيار المرحلة الدراسية ",                                  style: Text_Style.getstyle(                                      fontsize: MediaQuery.of(context)                                              .size                                              .longestSide /                                          40,                                      ColorText: Colorsapp.mainColor,                                      fontWeight: FontWeight.w700),                                ),                              ),                              Row_of_Button_stages(),                              Padding(                                padding:                                    const EdgeInsets.only(top: 30, bottom: 30),                                child: Container(                                    width:                                        MediaQuery.of(context).size.width / 5,                                    height: 60,                                    child: ElevatedButton(                                      style: ElevatedButton.styleFrom(                                        backgroundColor: Colorsapp.SecondColor,                                        shape: RoundedRectangleBorder(                                            borderRadius:                                                BorderRadius.circular(18)),                                      ),                                      onPressed: () async {                                        Stages.flags.value = true;                                        setState(() {});                                        if (Stages.button_clicked_news[0] == true) {                                          print(Stages.stages[0]);                                          Stages.stagesNews.add(Stages.stages[0]);                                        }                                        if (Stages.button_clicked_news[1] ==                                            true) {                                          print(Stages.stages[1]);                                          Stages.stagesNews                                              .add(Stages.stages[1]);                                        }                                        if (Stages.button_clicked_news[2] ==                                            true) {                                          print(Stages.stages[2]);                                          Stages.stagesNews                                              .add(Stages.stages[2]);                                        }                                        if (Stages.button_clicked_news[3] ==                                            true) {                                          print(Stages.stages[3]);                                          Stages.stagesNews                                              .add(Stages.stages[3]);                                        }                                        Future.delayed(                                            const Duration(seconds: 1), () {                                          Stages.flags.value = false;                                        });                                        if(Stages.news_title.text.isNotEmpty&&Stages.news1.text.isNotEmpty) {                                          await Methods.AddNews(                                            title: Stages.news_title.text,                                            body: Stages.news1.text,                                            image1: await Stages.ListOFurlNewsImage.value,                                            auther: FirebaseAuth                                                        .instance                                                        .currentUser                                                        ?.displayName !=                                                    null                                                ? "${FirebaseAuth.instance.currentUser?.displayName}"                                                : "User",                                            stage: Stages.stagesNews.isEmpty ? Stages.stages:Stages.stagesNews,                                            link1: Stages.news_Link.text);                                          Future.delayed(const Duration(seconds: 2), () async {                                            print("-------------------------------");                                            if(Stages.flagserrorNEWS1.value==true){                                              print("////////////////ppppppppppppppp//////////////////////////////");                                              Methods.showAlertDONE(context, "تم ارسال الخبر بنجاح");                                            }                                            if(Stages.flagserrorNEWS1.value==false){                                              print("///////////////////////////88888888888888888//////////////////////////");                                              Methods.showAlerterror(context, "لم يتم الاضافة");                                            }                                            print("-------------------------------");                                          });                                        }else{                                          if(Stages.news_title.text.isEmpty){                                            Stages.finaltext = Stages.text1;                                          }                                          if(Stages.news1.text.isEmpty){                                            Stages.finaltext = Stages.text2;                                          }                                          if(Stages.news1.text.isEmpty&&Stages.news_title.text.isEmpty){                                            Stages.finaltext = Stages.text3;                                          }                                          Methods.showAlerterror(context , Stages.finaltext);                                        }                                      },                                      child: Obx(() {                                        return Stages.flags.value == false                                            ? Text(                                                "ارسال",                                                style: Text_Style.getstyle(                                                    fontsize:                                                        MediaQuery.of(context)                                                                .size                                                                .longestSide /                                                            60,                                                    ColorText: Colors.black,                                                    fontWeight:                                                        FontWeight.w800),                                              )                                            : CircularProgressIndicator(color: Colorsapp.mainColor,);                                      }),                                    )),                              ),                            ],                          ),                        )))                : Container(),          ),        ),        if (MediaQuery.of(context).size.longestSide > 1000)          Image.asset(            "photo/1111.png",            width: MediaQuery.of(context).size.longestSide / 2.5,            height: MediaQuery.of(context).size.longestSide / 2.5,          ),      ],    );  }  // Widget buildZone51(BuildContext context) => Builder(  //       builder: (context) => DropzoneView(  //         operation: DragOperation.copy,  //         cursor: CursorType.grab,  //         onCreated: (ctrl) => Stages.controller1 = ctrl,  //         onLoaded: () => print('Zone 1 loaded'),  //         onError: (ev) => print('Zone 1 error: $ev'),  //         onHover: () {  //           setState(() => Stages.highlighted1 = true);  //           print('Zone 1 hovered');  //         },  //         onLeave: () {  //           setState(() => Stages.highlighted1 = false);  //           print('Zone 1 left');  //         },  //         onDrop: (ev) async {  //           print('Zone 1 drop: ${ev.name}');  //           setState(() {  //             Stages.message1 = '${ev.name} '.substring(0, 10);  //             Stages.highlighted1 = false;  //           });  //           final bytes = await Stages.controller1!.getFileData(ev);  //           print("========================");  //           print(bytes.runtimeType);  //           print("========================");  //  //           Stages.bytesData1 = bytes;  //         },  //         onDropMultiple: (ev) async {  //           print('Zone 1 drop multiple: $ev');  //         },  //       ),  //     );}