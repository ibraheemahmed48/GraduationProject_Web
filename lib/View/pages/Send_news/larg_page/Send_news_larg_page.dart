import 'dart:convert';import 'package:dotted_border/dotted_border.dart';import 'package:firebase_auth/firebase_auth.dart';import 'package:flutter/material.dart';import 'package:get/get.dart';import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';import 'dart:html' as html;import 'package:notificationsystem/controler/method.dart';import '../../../../controler/model.dart';import '../../../../help/Colors.dart';import '../../../../help/text_style.dart';import '../../student/Add_student/Add_student_larg_page/TextField_Add_student1.dart';import 'Row_of_Button_stages.dart';import 'Send_news_TextField.dart';import 'dart:async';import 'dart:io';class Send_news_larg_page extends StatefulWidget {  const Send_news_larg_page({Key? key}) : super(key: key);  @override  State<Send_news_larg_page> createState() => _Send_news_larg_pageState();}class _Send_news_larg_pageState extends State<Send_news_larg_page> {  @override  void initState() {    // TODO: implement initState  }  Widget build(BuildContext context) {    return Row(      mainAxisAlignment: MediaQuery.of(context).size.longestSide > 1000?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,      children: [        Padding(          padding:  EdgeInsets.only(left:  MediaQuery.of(context).size.longestSide > 1000?60:0),          child: Padding(            padding: const EdgeInsets.all(8.0),            child:  Container(                    height: MediaQuery.of(context).size.height,                    child: ScrollConfiguration(                        behavior: ScrollConfiguration.of(context)                            .copyWith(scrollbars: false),                        child: SingleChildScrollView(                          child: Column(                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,                            children: [                              Padding(                                padding: const EdgeInsets.only(top: 10),                                child: Text(                                  "ارسال خبر",                                  style: Text_Style.getstyle(                                      fontsize: MediaQuery.of(context).size.longestSide / ( MediaQuery.of(context).size.longestSide > 1000?30:20),                                      ColorText:  MediaQuery.of(context).size.longestSide > 1000?Colorsapp.mainColor:Colorsapp.White,                                      fontWeight: FontWeight.w700),                                ),                              ),                              Padding(                                padding: const EdgeInsets.only(top: 30),                                child: Row(                                  children: [                                    Obx(() {                                      return TextField_Add_Student(                                        typed_email: Stages.typed_title,                                        Email: Stages.news_title,                                        text: '',                                        width1:  MediaQuery.of(context).size.longestSide > 1000?2.5:1.3,                                        icon: Icon((Icons.title),                                            color:                                                Stages.typed_title.value.isEmpty                                                    ? Colors.grey                                                    : Colorsapp.mainColor),                                        maxline: 1,                                        onChanged: (text1) {                                          Stages.typed_title.value = text1;                                        },                                        pass: false,                                        margin_left: 0,                                      );                                    }),                                    Container(                                      height: 55,                                      padding: const EdgeInsets.only(top: 13),                                      child: Text(                                        " :العنوان ",                                        style: Text_Style.getstyle(                                            fontsize: 18,                                            ColorText:  MediaQuery.of(context).size.longestSide > 1000?Colorsapp.mainColor:Colorsapp.White,                                            fontWeight: FontWeight.w800),                                      ),                                    ),                                  ],                                ),                              ),                              Padding(                                padding: const EdgeInsets.only(top: 20),                                child: Send_news_TextField(news: Stages.news1),                              ),                              Padding(                                padding: const EdgeInsets.only(top: 30),                                child: Row(                                  children: [                                    Obx(() {                                      return TextField_Add_Student(                                        typed_email: Stages.typed_Link,                                        Email: Stages.news_Link,                                        text: '',                                        width1:  MediaQuery.of(context).size.longestSide > 1000?2.5:1.5,                                        icon: Icon((Icons.alternate_email),                                            color:                                                Stages.typed_Link.value.isEmpty                                                    ? Colors.grey                                                    : Colorsapp.mainColor),                                        maxline: 1,                                        onChanged: (text1) {                                          Stages.typed_Link.value = text1;                                        },                                        pass: false,                                        margin_left: 0,                                      );                                    }),                                    Container(                                      height: 55,                                      padding: const EdgeInsets.only(top: 13),                                      child: Text(                                        " :اضافة رابط ",                                        style: Text_Style.getstyle(                                            fontsize: 18,                                            ColorText:  MediaQuery.of(context).size.longestSide > 1000?Colorsapp.mainColor:Colorsapp.White,                                            fontWeight: FontWeight.w800),                                      ),                                    ),                                  ],                                ),                              ),                              GestureDetector(                                  onDoubleTap: () async {                                    print("11111111111111${Stages.urlNewsImage}");                                    await Methods.upLodeImagesnew(text: "news");                                    print("2222222222222${Stages.urlNewsImage}");                                  },                                  child: DottedBorder(                                    dashPattern: [10, 4],                                    strokeWidth: 2,                                    color: MediaQuery.of(context).size.longestSide > 1000?Colorsapp.mainColor:Colors.white,                                    strokeCap: StrokeCap.butt,                                    borderType: BorderType.RRect,                                    radius: const Radius.circular(5),                                    child: Container(                                      color: MediaQuery.of(context).size.longestSide > 1000?null:Colors.white,                                      width: MediaQuery.of(context).size.width / 2,                                      height: 130,                                      child: Stack(                                        children: [                                         // buildZone51(context),                                          Column(                                            mainAxisAlignment:                                                MainAxisAlignment.spaceAround,                                            children: [                                              Text(                                                "ارفاق صورة",                                                style: Text_Style.getstyle(                                                    fontsize: MediaQuery.of(context).size.longestSide > 1000?MediaQuery.of(context).size.longestSide / 70:MediaQuery.of(context).size.longestSide / 40,                                                    ColorText:                                                        Colorsapp.mainColor,                                                    fontWeight:                                                        FontWeight.w700),                                              ),                                              Center(                                                  child: Text(                                                Stages.message1,                                                style: Text_Style.getstyle(                                                    fontsize: MediaQuery.of(context).size.longestSide > 1000?MediaQuery.of(context).size.longestSide / 70:MediaQuery.of(context).size.longestSide / 55,                                                    ColorText:                                                        Colorsapp.mainColor,                                                    fontWeight:                                                        FontWeight.w500),                                              )),                                            ],                                          ),                                        ],                                      ),                                    ),                                  )                              ),                                  Padding(                                    padding: const EdgeInsets.all(8.0),                                    child: Obx(                                      () {                                        return  Stages.flagsNews.value== true?                                        Container(                                          decoration: BoxDecoration(                                              color: Colorsapp.Container_post,                                              borderRadius: BorderRadius.circular(15)                                          ),                                          height: MediaQuery.of(context).size.height/5,                                          width: MediaQuery.of(context).size.longestSide > 1000?MediaQuery.of(context).size.width/2:MediaQuery.of(context).size.width/1.2,                                          child: ListView.builder(                                            itemCount: Stages.ListOFurlNewsImage.length,                                            scrollDirection: Axis.horizontal,                                            itemBuilder: (BuildContext context, int index) {                                              return Padding(                                                padding: const EdgeInsets.all(4.0),                                                child: Container(                                                  decoration: BoxDecoration(                                                    color: Colorsapp.White,                                                    border: Border.all(                                                      color: Colorsapp.mainColor,                                                      width: 2,                                                    ) ,                                                    borderRadius: BorderRadius.circular(15),                                                  ) ,                                                  child: GestureDetector(                                                    onTap: (){                                                      setState(() {                                                      });                                                      print("*****************************");                                                      print(Stages.ListOFurlNewsImage[index]);                                                      print(Stages.ListOFurlNewsImage.indexOf(index));                                                    },                                                    child: ClipRRect(                                                        borderRadius: BorderRadius.circular(15),                                                        child: Image.network(                                                          Stages.ListOFurlNewsImage[index],                                                          fit: BoxFit.contain,                                                        )),                                                  ),                                                ),                                              );                                            },                                          ),                                        ):  Stages.ListOFurlNewsImage.isNotEmpty? Container(                                            decoration: BoxDecoration(                                                color: Colorsapp.Container_post,                                                borderRadius: BorderRadius.circular(15),                                            ),                                            height: MediaQuery.of(context).size.height/5,                                            width: MediaQuery.of(context).size.longestSide > 1000?MediaQuery.of(context).size.width/2:MediaQuery.of(context).size.width/1.2,                                            child:ListView.builder(                                              itemCount: Stages.ListOFurlNewsImage.length,                                              scrollDirection: Axis.horizontal,                                              itemBuilder: (BuildContext context, int index) {                                                return Padding(                                                  padding: const EdgeInsets.all(4.0),                                                  child: Container(                                                    decoration: BoxDecoration(                                                      color: Colorsapp.White,                                                      border: Border.all(                                                        color: Colorsapp.mainColor,                                                        width: 2,                                                      ) ,                                                      borderRadius: BorderRadius.circular(15),                                                    ) ,                                                    child: GestureDetector(                                                        onTap: (){                                                          setState(() {                                                          });                                                          print("*****************************");                                                          print(Stages.ListOFurlNewsImage[index]);                                                          print(Stages.ListOFurlNewsImage.indexOf(index));                                                        },                                                        child: ClipRRect(                                                        borderRadius: BorderRadius.circular(15),                                                        child: Image.network(                                                          Stages.ListOFurlNewsImage[index],                                                          fit: BoxFit.contain,                                                        ))),                                                  ),                                                );                                              },                                            )                                        ):Container();                                      }                                    ),                                  ),                              Padding(                                padding: const EdgeInsets.only(top: 30),                                child: Text(                                  "اختيار المرحلة الدراسية ",                                  style: Text_Style.getstyle(                                      fontsize: MediaQuery.of(context).size.longestSide > 1000?MediaQuery.of(context).size.longestSide / 40:MediaQuery.of(context).size.longestSide / 30,                                      ColorText:  MediaQuery.of(context).size.longestSide > 1000?Colorsapp.mainColor:Colorsapp.SecondColor,                                      fontWeight: FontWeight.w700),                                ),                              ),                              const Row_of_Button_stages(),                              Padding(                                padding:                                    const EdgeInsets.only(top: 30, bottom: 30),                                child: Container(                                    width:                                        MediaQuery.of(context).size.width / (MediaQuery.of(context).size.longestSide > 1000?5:4),                                    height: 60,                                    child: ElevatedButton(                                      style: ElevatedButton.styleFrom(                                        backgroundColor: Colorsapp.greenColor,                                        shape: RoundedRectangleBorder(                                            borderRadius:                                                BorderRadius.circular(18)),                                      ),                                      onPressed: () async {                                        Stages.flags.value = true;                                        setState(() {});                                        if (Stages.button_clicked_news[0] == true) {                                          print(Stages.stages[0]);                                          Stages.stagesNews.add(Stages.stages[0]);                                          Stages.stagesNewsUplode.add(Stages.stagesUplode[0]);                                        }                                        if (Stages.button_clicked_news[1] == true) {                                          print(Stages.stages[1]);                                          Stages.stagesNews.add(Stages.stages[1]);                                          Stages.stagesNewsUplode.add(Stages.stagesUplode[1]);                                        }                                        if (Stages.button_clicked_news[2] == true) {                                          print(Stages.stages[2]);                                          Stages.stagesNews.add(Stages.stages[2]);                                          Stages.stagesNewsUplode.add(Stages.stagesUplode[2]);                                        }                                        if (Stages.button_clicked_news[3] == true) {                                          print(Stages.stages[3]);                                          Stages.stagesNews.add(Stages.stages[3]);                                          Stages.stagesNewsUplode.add(Stages.stagesUplode[3]);                                        }                                        Future.delayed(                                            const Duration(seconds: 1), () {                                          Stages.flags.value = false;                                        });                                        if(Stages.news_title.text.isNotEmpty&&Stages.news1.text.isNotEmpty) {                                          await Methods.AddNews(                                            title: Stages.news_title.text,                                            body: Stages.news1.text,                                            image1: await Stages.ListOFurlNewsImage.value,                                            auther: FirebaseAuth                                                        .instance                                                        .currentUser                                                        ?.displayName !=                                                    null                                                ? "${FirebaseAuth.instance.currentUser?.displayName}"                                                : "User",                                            stage: Stages.stagesNews.toSet(),                                            link1: Stages.news_Link.text);                                          Future.delayed(const Duration(seconds: 2), () async {                                            print("-------------------------------");                                            if(Stages.flagserrorNEWS1.value==true){                                              print("////////////////ppppppppppppppp//////////////////////////////");                                               Methods.showAlertDONE(context, "تم ارسال الخبر بنجاح");                                              print("////////////////${Stages.stagesNewsUplode.length}//////////////////////////////");                                              for(int i =0;i<Stages.stagesNewsUplode.length;i++){                                                print("stagesNewsUplode: ${Stages.stagesNewsUplode[i]}");                                                await Methods.sendNotification(title: FirebaseAuth.instance.currentUser?.displayName!,body1: Stages.news1.text, topic: '${Stages.stagesNewsUplode[i]}');                                              }                                              Future.delayed(                                                  const Duration(seconds:2), () {                                                html.window.location.reload();                                              });                                            }                                            if(Stages.flagserrorNEWS1.value==false){                                              print("///////////////////////////88888888888888888//////////////////////////");                                              Methods.showAlerterror(context, "لم يتم الاضافة");                                            }                                            print("-------------------------------");                                          });                                        }else{                                          if(Stages.news_title.text.isEmpty){                                            Stages.finaltext = Stages.text1;                                          }                                          if(Stages.news1.text.isEmpty){                                            Stages.finaltext = Stages.text2;                                          }                                          if(Stages.news1.text.isEmpty&&Stages.news_title.text.isEmpty){                                            Stages.finaltext = Stages.text3;                                          }                                          if(Stages.stagesNews.isEmpty){                                            Stages.finaltext = Stages.text4;                                          }                                          Methods.showAlerterror(context , Stages.finaltext);                                        }                                      },                                      child: Obx(() {                                        return Stages.flags.value == false                                            ? Text(                                                "ارسال",                                                style: Text_Style.getstyle(                                                    fontsize:                                                        MediaQuery.of(context)                                                                .size                                                                .longestSide / (MediaQuery.of(context).size.longestSide > 1000?60:40),                                                    ColorText: Colors.black,                                                    fontWeight:                                                        FontWeight.w800),                                              )                                            : CircularProgressIndicator(color: Colorsapp.mainColor,);                                      }),                                    )),                              ),                            ],                          ),                        ))),          ),        ),        if (MediaQuery.of(context).size.longestSide > 1000)          Image.asset(            "photo/1111.png",            width: MediaQuery.of(context).size.longestSide / 2.5,            height: MediaQuery.of(context).size.longestSide / 2.5,          ),      ],    );  }  // Widget buildZone51(BuildContext context) => Builder(  //       builder: (context) => DropzoneView(  //         operation: DragOperation.copy,  //         cursor: CursorType.grab,  //         onCreated: (ctrl) => Stages.controller1 = ctrl,  //         onLoaded: () => print('Zone 1 loaded'),  //         onError: (ev) => print('Zone 1 error: $ev'),  //         onHover: () {  //           setState(() => Stages.highlighted1 = true);  //           print('Zone 1 hovered');  //         },  //         onLeave: () {  //           setState(() => Stages.highlighted1 = false);  //           print('Zone 1 left');  //         },  //         onDrop: (ev) async {  //           print('Zone 1 drop: ${ev.name}');  //           setState(() {  //             Stages.message1 = '${ev.name} '.substring(0, 10);  //             Stages.highlighted1 = false;  //           });  //           final bytes = await Stages.controller1!.getFileData(ev);  //           print("========================");  //           print(bytes.runtimeType);  //           print("========================");  //  //           Stages.bytesData1 = bytes;  //         },  //         onDropMultiple: (ev) async {  //           print('Zone 1 drop multiple: $ev');  //         },  //       ),  //     );}