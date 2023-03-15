import 'package:auto_size_text/auto_size_text.dart';import 'package:firebase_storage/firebase_storage.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:get/get.dart';import 'package:google_fonts/google_fonts.dart';import 'package:link_text/link_text.dart';import 'package:loading_animation_widget/loading_animation_widget.dart';import 'package:notificationsystem/controler/method.dart';import 'dart:html' as html;import '../../../../controler/Routes.dart';import '../../../../controler/model.dart';import '../../../../help/Colors.dart';import '../../../../help/text_style.dart';import 'Bar_OF_stages.dart';import 'Button_Delete.dart';class Schedules_larg_Page extends StatefulWidget {  const Schedules_larg_Page({Key? key}) : super(key: key);  @override  State<Schedules_larg_Page> createState() => _Schedules_larg_PageState();}class _Schedules_larg_PageState extends State<Schedules_larg_Page> {  @override  void initState() {    if(Stages.setflags.value==true){      setState(() {      });    }    super.initState();  }   RxBool deleteSchedules=false.obs;  @override  Widget build(BuildContext context) {    return Padding(      padding: EdgeInsets.only(        left:MediaQuery.of(context).size.width>1000?        (MediaQuery.of(context).size.width / 40) :        0      ),      child: Row(        mainAxisAlignment: MediaQuery.of(context).size.width>1000?        MainAxisAlignment.spaceBetween:        MainAxisAlignment.center,        children: [          Obx(             () {              return Methods.Schedulespost.value==true?              Container(                width:MediaQuery.of(context).size.width>1000?                (MediaQuery.of(context).size.width / 1.6):                MediaQuery.of(context).size.width / 1,                height: MediaQuery.of(context).size.height / 1.025,                child: Column(                  mainAxisAlignment: MainAxisAlignment.start,                  crossAxisAlignment: CrossAxisAlignment.center,                  children: [                    Padding(                      padding: EdgeInsets.only(                        top: MediaQuery.of(context).size.height / 25,                      ),                      child: Text(                        "المنشورات",                        style: Text_Style.getstyle(                            fontsize: MediaQuery.of(context).size.height / 15,                            ColorText: Colorsapp.SecondColor,                            fontWeight: FontWeight.w700),                      ),                    ),                    Obx(                       () {                        return Methods.SchedulessList.value.isEmpty?Container(                          width:MediaQuery.of(context).size.width>1000?                          (MediaQuery.of(context).size.width / 1.5):                          MediaQuery.of(context).size.width / 1.1,                          height: MediaQuery.of(context).size.height/1.4,                          child: Column(                            mainAxisAlignment: MainAxisAlignment.spaceBetween,                            crossAxisAlignment: CrossAxisAlignment.center,                            children: [                              Image.asset("photo/No data-cuate.png",                                width: MediaQuery.of(context).size.width/1,                                height: MediaQuery.of(context).size.height/2,                              ),                              Text(                                "لا يوجد منشورات",                                style: Text_Style.getstyle(                                    fontsize: MediaQuery.of(context).size.height / 20,                                    ColorText: Colorsapp.SecondColor,                                    fontWeight: FontWeight.w700),                              ),                              Padding(                                padding: const EdgeInsets.only(top: 50),                                child: Container(                                      width: 200,                                       height: MediaQuery.of(context).size.height/15,                                    child: ElevatedButton(                                    child: Icon(Icons.refresh_sharp,                                      size: 40,                                      color: Colors.white,                                    ),                                  onPressed: () {                                    html.window.location.reload();                                    Stages.PageController.value=1;                                  },                                  style: ButtonStyle(                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),                                      backgroundColor: MaterialStateProperty.all<Color>(Colorsapp.mainColor),                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(                                          RoundedRectangleBorder(                                              borderRadius: BorderRadius.circular(10),                                              side: BorderSide(color: Colors.white)                                          )                                      )                                  ),                                    )),                              ),    ]                          ),                        ): Expanded(                          child: Container(                            width:MediaQuery.of(context).size.width>1000?                            (MediaQuery.of(context).size.width / 1.5)                                :MediaQuery.of(context).size.width / 1.1,                            child: ListView.builder(                                itemCount: Methods.SchedulessList.length,                                itemBuilder: (BuildContext context, int index) {                                  return Padding(                                    padding: EdgeInsets.symmetric(                                        horizontal: 5, vertical: 20),                                    child: Container(                                      width: MediaQuery.of(context).size.width / 5,                                      decoration: BoxDecoration(                                        color: Colorsapp.Container_post,                                        borderRadius: BorderRadius.all(Radius.circular(                                            10.0) //                 <--- border radius here                                        ),                                      ),                                      child: Column(                                        mainAxisAlignment:                                        MainAxisAlignment.spaceBetween,                                        children: [                                          Bar_OF_stages_Schedules(                                            onPressed: () async {                                              print("delete1 :${Methods.SchedulessList.length}");                                              await Methods.Schedules.doc(Methods.SchedulessList[index].id).delete().whenComplete(() => {                                                deleteSchedules.value=true                                              });                                              // for(int i=0;i<Methods.SchedulessList[index]["Images"].length;i++){                                              //                                              //   await FirebaseStorage.instance.refFromURL(Methods.SchedulessList[index]["Images"][i]).delete();                                              // }                                              if (deleteSchedules.value==true){                                                print("delete5 :${Methods.SchedulessList.length}");                                                Future.delayed(                                                    const Duration(                                                        seconds:0), () {                                                  setState(() {                                                    Methods.SchedulessList                                                        .removeAt(index);                                                    print(index);                                                  });                                                });                                              }                                            },                                            RowOftext: Row(                                              children: [                                                       Padding(                                                        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width>1000?0:0),                                                        child: Text(                                                          textDirection:                                                          TextDirection.rtl,                                                          Methods.SchedulessList[index]["Stages"].toString(),                                                          style: Text_Style.getstyle(                                                              fontsize: MediaQuery.of(context).size.width>1000?                                                              MediaQuery.of(context).size.height / 35 :                                                              MediaQuery.of(context).size.height / 40,                                                              ColorText: Colorsapp                                                                  .mainColor,                                                              fontWeight:                                                              FontWeight                                                                  .w500),                                                        ),                                                      ),                                                Center(                                                    child: Text(                                                      textAlign: TextAlign.center,                                                      textDirection: TextDirection.rtl,                                                      "المرحلة : ",                                                      style: Text_Style.getstyle(                                                          fontsize: MediaQuery.of(context)                                                              .size                                                              .height /                                                              35,                                                          ColorText: Colorsapp.mainColor,                                                          fontWeight: FontWeight.w900),                                                    )),                                              ],                                            ),                                          ),                                          Padding(                                            padding: EdgeInsets.all(8),                                            child: Column(                                              children: [                                                Padding(                                                  padding: const EdgeInsets.all(5.0),                                                  child: Container(                                                      width: MediaQuery.of(context).size.width / 1.2,                                                      child: AutoSizeText(                                                          textAlign: TextAlign.start,                                                          textDirection: TextDirection.rtl,                                                          "${Methods.SchedulessList[index]["Title"].toString() }",                                                          style: GoogleFonts.tajawal(                                                            textStyle: TextStyle(                                                                fontFamily: 'Al Jazeera Arabic',                                                                fontSize:                                                                MediaQuery.of(context).size.height / 35,                                                                color: Colorsapp.redColor,                                                                fontWeight: FontWeight.w800),                                                          ))),                                                ),                                                if (Methods.SchedulessList[index]["Images"].isNotEmpty)                                                  Container(                                                      width:MediaQuery.of(context).size.width>1000?                                                      MediaQuery.of(context).size.width / 1.8:                                                      MediaQuery.of(context).size.width / 1.2,                                                      height: 400,                                                      child: Padding(                                                            padding: const EdgeInsets.all(5.0),                                                            child: Container(                                                                decoration: BoxDecoration(                                                                    color: Colors.white,                                                                    borderRadius: BorderRadius.circular(10),                                                                    border:Border.all(                                                                        color: Colorsapp.mainColor,                                                                        width: 2                                                                    )                                                                ),                                                                child: ClipRRect(                                                                    borderRadius: BorderRadius.circular(10),                                                                    child: Image.network(                                                                      Methods.SchedulessList[index]["Images"].toString(),                                                                      fit: BoxFit.contain,                                                                    ))),                                                          )                                                  ),                                                Padding(                                                  padding: const EdgeInsets.all(8.0),                                                  child: Container(                                                      width: MediaQuery.of(context).size.width / 1.2,                                                      child: AutoSizeText(                                                        textAlign: TextAlign.center,                                                        textDirection: TextDirection.rtl,                                                        Methods.SchedulessList[index]["type"].toString(),                                                        style: Text_Style.getstyle(                                                          fontsize: MediaQuery.of(context).size.height / 30,                                                          ColorText: Colorsapp.mainColor,                                                          fontWeight: FontWeight.w500),                                                      )),                                                ),                                                Row(                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,                                                  children: [                                                    Container(                                                      padding: EdgeInsets.all(5),                                                      height: 50,                                                      width: 150,                                                      decoration: const BoxDecoration(                                                          color: Colors.white70,                                                          borderRadius: BorderRadius.all(Radius.circular(10))                                                      ),                                                      child: Row(                                                        mainAxisAlignment:                                                        MainAxisAlignment                                                            .spaceBetween,                                                        children:  [                                                          Column(                                                            mainAxisAlignment:                                                            MainAxisAlignment                                                                .center,                                                            children: [                                                              Icon(Icons.thumb_down,size: 15,                                                                  color: Colorsapp.mainColor                                                              ),                                                              Text(                                                                "${Methods.SchedulessList[index]["dislikes"].length}",                                                                textDirection:TextDirection.rtl,                                                                style: Text_Style.getstyle(                                                                  fontWeight: FontWeight.w600,                                                                  ColorText: Colorsapp.SecondColor,                                                                  fontsize: MediaQuery.of(context).size.height / 40,                                                                ),                                                              ),                                                            ],                                                          ),                                                          Column(                                                            mainAxisAlignment:                                                            MainAxisAlignment                                                                .center,                                                            children: [                                                              Icon(Icons.thumb_up,size: 15,                                                                  color: Colorsapp.mainColor),                                                              Text(                                                                "${Methods.SchedulessList[index]["likes"].length}",                                                                textDirection:TextDirection.rtl,                                                                style: Text_Style.getstyle(                                                                  fontWeight: FontWeight.w600,                                                                  ColorText: Colorsapp.SecondColor,                                                                  fontsize: MediaQuery.of(context).size.height / 40,                                                                ),                                                              ),                                                            ],                                                          ),                                                          Column(                                                            mainAxisAlignment:                                                            MainAxisAlignment                                                                .center,                                                            children: [                                                              Icon(Icons.favorite,size: 15,                                                                  color: Colorsapp.mainColor                                                              ),                                                              Text(                                                                "${Methods.SchedulessList[index]["favorites"].length}",                                                                textDirection:TextDirection.rtl,                                                                style: Text_Style.getstyle(                                                                  fontWeight: FontWeight.w600,                                                                  ColorText: Colorsapp.SecondColor,                                                                  fontsize: MediaQuery.of(context).size.height / 40,                                                                ),                                                              ),                                                            ],                                                          )                                                        ],                                                      ),                                                    ),                                                    Align(                                                        alignment:                                                        Alignment.centerLeft,                                                        child: Text(                                                          "  ${Methods.SchedulessList[index].id.toString().substring(10)}",                                                          textDirection:                                                          TextDirection.ltr,                                                          style: Text_Style.getstyle(                                                            fontWeight:                                                            FontWeight.w400,                                                            ColorText:                                                            Colorsapp.redColor,                                                            fontsize:                                                            MediaQuery.of(context).size.height / 40,                                                          ),                                                        )),                                                  ],                                                )                                              ],                                            ),                                          )                                        ],                                      ),                                    ),                                  );                                }),                          ),                        );                      }                    )                  ],                ),              ):Padding(                padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width/4),                child: LoadingAnimationWidget.flickr(                  size: 200,                 leftDotColor: Colorsapp.mainColor,                  rightDotColor: Colorsapp.SecondColor,                  //color: Colorsapp.mainColor,                ),              );            }          ),          ///////////////////////          //////////////////////////////          ///////////////////////////////////////////////          ///////////////////////////////////////////////////////////          if (MediaQuery.of(context).size.longestSide > 1000)            Column(              mainAxisAlignment: MainAxisAlignment.spaceAround,              children: [                Image.asset("photo/1111.png",                    width: MediaQuery.of(context).size.width / 3.6,                    height: MediaQuery.of(context).size.height / 1.8,                    alignment: Alignment.centerRight),                Text(                  "الجداول",                  style: Text_Style.getstyle(                      fontsize: MediaQuery.of(context).size.height / 15,                      ColorText: Colorsapp.SecondColor,                      fontWeight: FontWeight.w700),                ),                Row(                  mainAxisAlignment: MainAxisAlignment.spaceBetween,                  children: [                    Text(                      "SWAP",                      style: Text_Style.getstyle(                          fontsize: MediaQuery.of(context).size.height / 20,                          ColorText: Colorsapp.White,                          fontWeight: FontWeight.w500),                    ),                    Icon(                      Icons.arrow_forward,                      color: Colorsapp.White,                      size: 30,                    ),                  ],                ),              ],            ),        ],      ),    );  }}