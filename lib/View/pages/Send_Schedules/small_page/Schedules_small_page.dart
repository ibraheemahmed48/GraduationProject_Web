// import 'dart:convert';// import 'dart:typed_data';//// import 'package:dotted_border/dotted_border.dart';// import 'package:firebase_auth/firebase_auth.dart';// import 'package:flutter/cupertino.dart';// import 'package:flutter/material.dart';// import 'package:flutter_dropzone/flutter_dropzone.dart';// import 'package:get/get.dart';// import 'dart:html' as html;// import 'package:http/http.dart' as http;//// import '../../../../controler/method.dart';// import '../../../../controler/model.dart';// import '../../../../help/Colors.dart';// import '../../../../help/text_style.dart';// import '../../Send_news/small_page/Send_news_TextField_small.dart';// import '../larg_page/Schedules_Button1.dart';// import 'Row_of_Button_Schedules.dart';// import 'Row_of_Button_stages_Small.dart';// import '../larg_page/Row_of_Button_stages.dart';// import 'Schedules_TextField_small.dart';//// class Schedules_small_page extends StatefulWidget {//   const Schedules_small_page({Key? key}) : super(key: key);////   @override//   State<Schedules_small_page> createState() => _Schedules_small_pageState();// }//// class _Schedules_small_pageState extends State<Schedules_small_page> {////////////   @override//   Widget build(BuildContext context) {//     return Center(//       child: ScrollConfiguration(//         behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),//         child: SingleChildScrollView(//           child: Column(//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,//             children: [//               Image.asset(//                 "photo/1111.png",//                 width: MediaQuery.of(context).size.longestSide /3.5,//                 height: MediaQuery.of(context).size.longestSide / 3.5,//               ),////               Text(//                 "اضافة جدول",//                 style: Text_Style.getstyle(//                     fontsize://                     MediaQuery.of(context).size.longestSide / 20,//                     ColorText: Colorsapp.White,//                     fontWeight: FontWeight.w700),//               ),//               Padding(//                 padding: const EdgeInsets.only(top: 20),//                 child: Schedules_TextField_small(news: Stages.add_Schedules,),//               ),//               Padding(//                 padding: const EdgeInsets.only(top: 20),//                 child: GestureDetector(//                     onDoubleTap: () async {//                       print("ssssss");////                       print("11111111111111${Stages.urlSchedulesImage}");//                       await Methods.upLodeImageSchedules(text: "Schedules");////                       print("2222222222222${Stages.urlSchedulesImage}");////                     },//                     child: DottedBorder(//                       dashPattern: [10, 4],//                       strokeWidth: 2,//                       color: Colorsapp.White,//                       strokeCap: StrokeCap.butt,//                       borderType: BorderType.RRect,//                       radius: Radius.circular(5),//                       child: Container(//                         width: MediaQuery.of(context).size.width / 2.5,//                         height: MediaQuery.of(context).size.height / 11,//                         color: Colorsapp.White,//                         child: Stack(//                           children: [//                             //buildZone1(context),//                             Column(//                               mainAxisAlignment: MainAxisAlignment.spaceAround,//                               children: [//                                 Text(//                                   "ارفاق صورة",//                                   style: Text_Style.getstyle(//                                       fontsize: MediaQuery.of(context).size.longestSide / 60,//                                       ColorText: Colorsapp.mainColor,//                                       fontWeight: FontWeight.w700),//                                 ),//                                 Center(child: Text(Stages.message1, style: Text_Style.getstyle(//                                     fontsize: MediaQuery.of(context).size.longestSide / 70,//                                     ColorText: Colorsapp.mainColor,//                                     fontWeight: FontWeight.w500),)),//                               ],//                             ),//                           ],//                         ),//                       ),//                     )),//               ),////               Padding(//                 padding: const EdgeInsets.all(8.0),//                 child: Obx(//                         () {//                       return  Stages.flagsSchedules1.value== true?//                       Container(//                           decoration: BoxDecoration(//                             color: Colorsapp.Container_post,//                             borderRadius: BorderRadius.circular(15),//                             border: Border.all(//                               color: Colorsapp.White,//                               width: 2,////                             ) ,//                           ),//                          // width: MediaQuery.of(context).size.width/5,//                           height: MediaQuery.of(context).size.height/5,//                           child: ClipRRect(//                               borderRadius: BorderRadius.circular(15),//                               child: Image.network(//                                 Stages.urlSchedulesImage,//                                 fit: BoxFit.contain,//////                               ))//                       ):Container(////////                       );//                     }//                 ),//               ),////////////               Padding(//                 padding: const EdgeInsets.only(top: 20),//                 child: Container(//                   child: Row_of_Button_Schedules()//                 ),//               ),////////               Padding(//                 padding: const EdgeInsets.only(top: 20),//                 child: Text(//                   "اختيار المرحلة الدراسية ",//                   style: Text_Style.getstyle(//                       fontsize://                       MediaQuery.of(context).size.longestSide / 25,//                       ColorText: Colorsapp.White,//                       fontWeight: FontWeight.w700),//                 ),//               ),//               Row_of_Button_stages_Small(),//               Padding(//                 padding: const EdgeInsets.only(top: 20,bottom: 20),//                 child: Container(//                     width: MediaQuery.of(context).size.width / 3,//                     height: 50,//                     child: ElevatedButton(//                       style: ElevatedButton.styleFrom(//                         backgroundColor: Colorsapp.greenColor,//                         shape: RoundedRectangleBorder(//                             borderRadius: BorderRadius.circular(18)),//                       ),//                       onPressed: () async {////                         Stages.flagsSchedules2.value = true;////                         Future.delayed(const Duration(seconds: 1), () {//                           Stages.flagsSchedules2.value = false;//                         });////                         setState(() {});//                         if (Stages.button_clicked_Schedules[0] == true) {//                           print(Stages.stages[0]);//                           Stages.stagesSchedules = Stages.stages[0];//                         }//                         if (Stages.button_clicked_Schedules[1] == true) {//                           Stages.stagesSchedules = Stages.stages[1];//                           print(Stages.stages[1]);//                         }//                         if (Stages.button_clicked_Schedules[2] == true) {//                           print(Stages.stages[2]);//                           Stages.stagesSchedules = Stages.stages[2];//                         }////                         if (Stages.button_clicked_Schedules[3] == true) {//                           print(Stages.stages[3]);//                           Stages.stagesSchedules = Stages.stages[3];//                         }//                         if (Stages.urlSchedulesImage.isEmpty) {//                           Methods.showAlerterror(context, "لا يوجد صورة");//                         } else if (Stages.typeofSchedules.isEmpty) {//                           Methods.showAlerterror(//                               context, "لا يوجد نوع الجدول");//                         } else {//                           await Methods.AddSchedules(//                             title: Stages.add_Schedules.text,//                             image1: await Stages.urlSchedulesImage,//                             auther: FirebaseAuth//                                 .instance.currentUser?.displayName !=//                                 null//                                 ? "${FirebaseAuth.instance.currentUser?.displayName}"//                                 : "User",//                             stage: Stages.stagesSchedules.isEmpty//                                 ? Stages.stages//                                 : Stages.stagesSchedules,//                             type: Stages.typeofSchedules,//                           );////                           Future.delayed(const Duration(seconds: 2),//                                   () async {//                                 print("-------------------------------");//                                 if (Stages.flagsSchedules.value == true) {//                                   print(//                                       "////////////////ppppppppppppppp//////////////////////////////");//                                   Methods.showAlertDONE(//                                       context, "تم الاضافة بنجاح");////                                   Future.delayed(const Duration(seconds: 2),//                                           () async {//                                         print("-------------------------------");//                                         html.window.location.reload();//                                       });//                                 }//                                 if (Stages.flagsSchedules.value == false) {//                                   print(//                                       "///////////////////////////88888888888888888//////////////////////////");//                                   Methods.showAlerterror(//                                       context, "لم يتم الاضافة");//                                 }////                                 print("-------------------------------");//                               });//                         }////////////                       },//                       child: Obx(//                          () {//                           return Stages.flagsSchedules2.value == false?Text(//                             "اضافة",//                             style: Text_Style.getstyle(//                                 fontsize://                                 MediaQuery.of(context).size.longestSide ///                                     32,//                                 ColorText: Colorsapp.White,//                                 fontWeight: FontWeight.w800),//                           ):CircularProgressIndicator(color: Colorsapp.mainColor,);//                         }//                       ),//                     )),//               ),//////////             ],//           ),//         ),//       ),//     );//   }//   // Widget buildZone1(BuildContext context) => Builder(//   //   builder: (context) => DropzoneView(//   //     operation: DragOperation.copy,//   //     cursor: CursorType.grab,//   //     onCreated: (ctrl) => Stages.controller1 = ctrl,//   //     onLoaded: () => print('Zone 1 loaded'),//   //     onError: (ev) => print('Zone 1 error: $ev'),//   //     onHover: () {//   //       setState(() => Stages.highlighted1 = true);//   //       print('Zone 1 hovered');//   //     },//   //     onLeave: () {//   //       setState(() => Stages.highlighted1 = false);//   //       print('Zone 1 left');//   //     },//   //     onDrop: (ev) async {//   //       print('Zone 1 drop: ${ev.name}');//   //       setState(() {//   //         Stages.message1 = '${ev.name} '.substring(0,10);//   //         Stages.highlighted1 = false;//   //       });//   //       final bytes = await Stages.controller1!.getFileData(ev);//   //       print(bytes);//   //       Stages.bytesData1 =bytes;//   ////   //       print("${ev.path.runtimeType}11111111111111");//   //     },//   //     onDropMultiple: (ev) async {//   //       print('Zone 1 drop multiple: $ev');//   //     },//   //   ),//   // );////// }//////