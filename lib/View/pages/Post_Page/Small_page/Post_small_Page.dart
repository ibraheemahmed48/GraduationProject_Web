import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:notificationsystem/View/pages/Post_Page/Small_page/List_of_Post.dart';import '../../../../help/Colors.dart';import '../../../../help/text_style.dart';import '../../controler/model.dart';import '../larg_page/List_of_Post.dart';class Post_small_Page extends StatefulWidget {  const Post_small_Page({Key? key}) : super(key: key);  @override  State<Post_small_Page> createState() => _Post_small_PageState();}class _Post_small_PageState extends State<Post_small_Page> {  @override  Widget build(BuildContext context) {    return Column(      children: [        Padding(          padding: const EdgeInsets.all(8.0),          child: Container(            width: MediaQuery.of(context).size.width/1.025,            height: MediaQuery.of(context).size.height/1.025,            child: Column(              children: [                Text(                  "المنشورات",                  style: Text_Style.getstyle(                      fontsize: MediaQuery.of(context).size.longestSide / 20,                      ColorText: Colorsapp.SecondColor,                      fontWeight: FontWeight.w700),                ),                Expanded(                  child: Container(                    width: MediaQuery.of(context).size.width,                    child: ListView.builder(                        itemCount: Stages.list_ofimage.length,                        itemBuilder: (BuildContext context, int index) {                          return  List_of_post_samll(                            onPressed: () {                              print(Stages.list_ofimage[index]);                              print(Stages.list_of_Text[index]);                            },                            images: Stages.list_ofimage[index],                            text: Stages.list_of_Text[index],                            Row_of_text: Row(                              children: [                                Container(                                  width: MediaQuery.of(context).size.width /1.7,                                  child:Directionality(                                      textDirection: TextDirection.rtl,                                      child: ListView.builder(                                          scrollDirection: Axis.horizontal,                                          itemCount: Stages.stages.length,                                          itemBuilder: (BuildContext context, int index){                                            return  Padding(                                              padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height / 50,),                                              child: Text(                                                textAlign: TextAlign.center,                                                textDirection: TextDirection.rtl,                                                "${Stages.stages[index]} , ",                                                style: Text_Style.getstyle(                                                    fontsize: MediaQuery.of(context)                                                        .size                                                        .height /                                                        40,                                                    ColorText: Colorsapp.mainColor,                                                    fontWeight: FontWeight.w800),                                              ),                                            );                                          })),                                ),                                Center(                                    child: Text(                                      textAlign: TextAlign.center,                                      textDirection: TextDirection.rtl,                                      "المرحلة : ",                                      style: Text_Style.getstyle(                                          fontsize:                                          MediaQuery.of(context)                                              .size                                              .height /                                              40,                                          ColorText:                                          Colorsapp.mainColor,                                          fontWeight: FontWeight.w900),                                    )),                              ],                            ), link: Stages.list_of_link[index],                          );                        }),                  ),                ),              ],            ),          ),        )      ],    );  }}