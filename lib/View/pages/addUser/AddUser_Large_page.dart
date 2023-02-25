import 'package:cloud_firestore/cloud_firestore.dart';import 'package:email_validator/email_validator.dart';import 'package:firebase_auth/firebase_auth.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:get/get.dart';import 'package:get/get_core/src/get_main.dart';import 'package:get/get_rx/src/rx_types/rx_types.dart';import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';import 'package:loading_animation_widget/loading_animation_widget.dart';import '../../../controler/Routes.dart';import '../../../controler/method.dart';import '../../../controler/model.dart';import '../../../help/Colors.dart';import '../../../help/text_style.dart';import '../FirstPage/Home_Button_big.dart';import '../FirstPage/Home_Button_small.dart';import '../FirstPage/first_main_page.dart';import '../Signin_page/TextField_1.dart';import 'package:get/get.dart';class AddUser_Large_page extends StatefulWidget {  const AddUser_Large_page({Key? key}) : super(key: key);  @override  State<AddUser_Large_page> createState() => _AddUser_Large_pageState();}class _AddUser_Large_pageState extends State<AddUser_Large_page> {  @override  void initState() {    super.initState();  }  bool isValid = false;  Widget build(BuildContext context) {    return MediaQuery.of(context).size.height > 230        ? SingleChildScrollView(            child: Row(            mainAxisAlignment: MediaQuery.of(context).size.width > 1000                ? MainAxisAlignment.spaceBetween                : MainAxisAlignment.center,            children: [              Padding(                padding: MediaQuery.of(context).size.width > 1000                    ? EdgeInsets.only(left: 30)                    : EdgeInsets.only(left: 0),                child: Container(                  width: MediaQuery.of(context).size.width > 1000                      ? MediaQuery.of(context).size.width / 3                      : MediaQuery.of(context).size.width,                  height: MediaQuery.of(context).size.height / 1.025,                  child: Padding(                    padding: const EdgeInsets.only(top: 30),                    child: Column(                      mainAxisAlignment: MainAxisAlignment.center,                      crossAxisAlignment: CrossAxisAlignment.center,                      children: [                        Padding(                          padding: EdgeInsets.only(                              bottom: MediaQuery.of(context).size.height / 25),                          child: Text(                            "أضافة حساب",                            style: Text_Style.getstyle(                                fontsize: MediaQuery.of(context)                                                .size                                                .longestSide /                                            MediaQuery.of(context).size.width >                                        1000                                    ? 1                                    : 30,                                ColorText:                                    MediaQuery.of(context).size.width > 1000                                        ? Colorsapp.mainColor                                        : Colorsapp.SecondColor,                                fontWeight: FontWeight.w700),                          ),                        ),                        Padding(                          padding: const EdgeInsets.only(bottom: 30),                          child: Obx(() {                            return TextField_1(                              typed_email: Stages.typed_name_Adduser,                              Email: Stages.name_Adduser,                              text: 'Name:',                              width1: MediaQuery.of(context).size.width > 1000                                  ? 3                                  : 1.2,                              icon: Icon((Icons.person),                                  color: Stages.typed_name_Adduser.value.isEmpty                                      ? Colors.black                                      : Colorsapp.mainColor),                              maxline: 1,                              onChanged: (text1) {                                Stages.typed_name_Adduser.value = text1;                              },                              pass: false,                            );                          }),                        ),                        Padding(                          padding: const EdgeInsets.only(bottom: 30),                          child: Obx(() {                            return TextField_1(                              typed_email: Stages.typed_email_Adduser,                              Email: Stages.Email_Adduser,                              text: 'Email:',                              width1: MediaQuery.of(context).size.width > 1000                                  ? 3                                  : 1.2,                              icon: Icon((Icons.alternate_email),                                  color: Stages.typed_email_Adduser.value.isEmpty                                      ? Colors.black                                      : Colorsapp.mainColor),                              maxline: 1,                              onChanged: (text1) {                                Stages.typed_email_Adduser.value = text1;                              },                              pass: false,                            );                          }),                        ),                        Padding(                          padding: const EdgeInsets.only(bottom: 30),                          child: Obx(() {                            return TextField_1(                              typed_email: Stages.typed_passowrd_Adduser,                              Email: Stages.passowrd_Adduser,                              text: 'Passowrd',                              width1: MediaQuery.of(context).size.width > 1000                                  ? 3                                  : 1.2,                              icon: IconButton(                                icon: Icon(Stages.swich == true                                    ? Icons.visibility_off                                    : Icons.visibility),                                color: Stages.typed_passowrd_Adduser.value.isEmpty                                    ? Colors.black                                    : Colorsapp.mainColor,                                onPressed: () {                                  setState(() {                                    if (Stages.swich == false) {                                      Stages.swich = true.obs;                                    } else {                                      Stages.swich = false.obs;                                    }                                  });                                  print(Stages.swich);                                },                              ),                              onChanged: (text2) {                                Stages.typed_passowrd_Adduser.value = text2;                              },                              pass: Stages.swich.value,                            );                          }),                        ),                        if (MediaQuery.of(context).size.height > 305)                          Padding(                              padding: EdgeInsets.only(                                top: MediaQuery.of(context).size.height / 15,                              ),                              child: MediaQuery.of(context).size.width > 1000                                  ? Home_Button_big(                                      Text_Button: 'أضافة حساب',                                      onPressed: () async {                                        Stages.errorAdduser1.value = true;                                        setState(() {                                          print(                                              "/////////////////////////////////////////////////////////////////");                                        });                                        await FirebaseAuth.instance.signOut();                                        await Methods.AddAdmin(                                          email: Stages.Email_Adduser.text,                                          passowrd: Stages.passowrd_Adduser.text,                                          Username: Stages.name_Adduser.text,                                        );                                        if (Stages.flagsAdduser.value == true) {                                          print(                                              "##############1111111111###################");                                          if (Stages.errorAdduser2.value ==                                              false) {                                            Future.delayed(                                                const Duration(seconds: 2), () {                                              Methods.showAlerterror(                                                  context, Stages.alartADDuser);                                            });                                          } else {                                            Future.delayed(                                                const Duration(seconds: 2), () {                                              print(                                                  "FirebaseAuth${FirebaseAuth.instance.currentUser?.displayName.toString()}");                                              Methods.showAlertDONE(                                                  context, Stages.alartADDuser);                                              FirebaseAuth.instance.signOut();                                              Get.rootDelegate                                                  .toNamed(Routes.Sign_IN_Page);                                              print(                                                  "FirebaseAuth1${FirebaseAuth.instance.currentUser?.displayName.toString()}");                                            });                                          }                                        }                                        Future.delayed(const Duration(seconds: 2),                                            () {                                          Stages.flagsAdduser.value == true;                                        });////////////////////////////////////////////////////////                                        Future.delayed(const Duration(seconds: 2),                                            () {                                          Stages.errorAdduser1.value = false;                                        });                                        ///////////////////////////////////////////////////                                      },                                      X: MediaQuery.of(context).size.width > 1000                                  ? 55.obs                                  : 40.obs,                                width: 4.obs,                                    )                                  : Home_Button_small(                                      Text_Button: 'أضافة حساب',                                      onPressed: () async {                                        Stages.errorAdduser1.value = true;                                        setState(() {                                          print(                                              "/////////////////////////////////////////////////////////////////");                                        });                                        await FirebaseAuth.instance.signOut();                                        await Methods.AddAdmin(                                          email: Stages.Email_Adduser.text,                                          passowrd: Stages.passowrd_Adduser.text,                                          Username: Stages.name_Adduser.text,                                        );                                        if (Stages.flagsAdduser.value == true) {                                          print(                                              "##############1111111111###################");                                          if (Stages.errorAdduser2.value ==                                              false) {                                            Future.delayed(                                                const Duration(seconds: 2), () {                                              Methods.showAlerterror(                                                  context, Stages.alartADDuser);                                            });                                          } else {                                            Future.delayed(                                                const Duration(seconds: 2), () {                                              Methods.showAlertDONE(                                                  context, Stages.alartADDuser);                                              FirebaseAuth.instance.signOut();                                              Get.rootDelegate                                                  .toNamed(Routes.Sign_IN_Page);                                              print(                                                  "FirebaseAuth1${FirebaseAuth.instance.currentUser?.displayName.toString()}");                                            });                                          }                                        }                                        Future.delayed(const Duration(seconds: 2),                                            () {                                          Stages.flagsAdduser.value == true;                                        });////////////////////////////////////////////////////////                                        Future.delayed(const Duration(seconds: 2),                                            () {                                          Stages.errorAdduser1.value = false;                                        });                                        ///////////////////////////////////////////////////                                      },                                      X: MediaQuery.of(context).size.width > 1000                                          ? 55.obs                                          : 40.obs                              )),                        Obx(() {                          return Stages.errorAdduser1.value == true                              ? Padding(                                  padding: const EdgeInsets.only(top: 30),                                  child: Container(                                    height: 50,                                    width: 50,                                    child: LoadingAnimationWidget.flickr(                                      leftDotColor:                                          MediaQuery.of(context).size.width > 1000                                              ? Colorsapp.mainColor                                              : Colorsapp.White,                                      rightDotColor: Colorsapp.SecondColor,                                      size: 100,                                      //color: Colorsapp.mainColor,                                    ),                                  ),                                )                              : Padding(                                  padding: const EdgeInsets.only(top: 50),                                  child: Container(                                    height: 50,                                    width: 50,                                  ),                                );                        }),                        if(MediaQuery.of(context).size.height > 190)                          Text(                            "MTCE",                            style: Text_Style.getstyle(                                fontsize: MediaQuery.of(context).size.longestSide / (MediaQuery.of(context).size.width>1000?35:20),                                ColorText: MediaQuery.of(context).size.width>1000?Colorsapp.mainColor:Colorsapp.White,                                fontWeight: FontWeight.w700),                          ),                      ],                    ),                  ),                ),              ),              if (MediaQuery.of(context).size.longestSide > 1000)                Padding(                  padding: const EdgeInsets.only(left: 100),                  child: Image.asset(                    "photo/1111.png",                    width: MediaQuery.of(context).size.longestSide / 2,                    height: MediaQuery.of(context).size.longestSide / 2,                  ),                ),            ],          ))        : Image.asset(            "photo/1111.png",            width: MediaQuery.of(context).size.longestSide / 2,            height: MediaQuery.of(context).size.longestSide / 2,          );  }}