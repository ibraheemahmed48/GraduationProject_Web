import 'package:email_validator/email_validator.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:get/get.dart';import 'package:get/get_core/src/get_main.dart';import 'package:get/get_rx/src/rx_types/rx_types.dart';import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';import '../../../controler/Routes.dart';import '../../../controler/model.dart';import '../../../help/Colors.dart';import '../../../help/text_style.dart';import '../FirstPage/Home_Button_big.dart';import '../FirstPage/first_main_page.dart';import 'Signin_main_page.dart';import 'TextField_1.dart';import 'package:get/get.dart';class Signin_page_large extends StatefulWidget {  const Signin_page_large({Key? key}) : super(key: key);  @override  State<Signin_page_large> createState() => _Signin_page_largeState();}class _Signin_page_largeState extends State<Signin_page_large> {  @override  bool isValid  = false;  Widget build(BuildContext context) {    return Padding(      padding:EdgeInsets.only(left: MediaQuery.of(context).size.width / 50,),      child: Row(        mainAxisAlignment: MainAxisAlignment.start,        children: [          Container(            width: MediaQuery.of(context).size.width / 3,            height: MediaQuery.of(context).size.height / 1.025,            child: Column(              mainAxisAlignment: MainAxisAlignment.center,              crossAxisAlignment: CrossAxisAlignment.center,              children: [                Padding(                  padding:  EdgeInsets.only(bottom:MediaQuery.of(context).size.height / 25                  ),                  child: Text(                    "تسجيل دخول",                    style: Text_Style.getstyle(                        fontsize: MediaQuery.of(context).size.longestSide / 30,                        ColorText: Colorsapp.mainColor,                        fontWeight: FontWeight.w700),                  ),                ),                Obx((){                    return TextField_1(typed_email: Stages.typed_email_signin,                      Email: Stages.Email_signin,                      text: 'Email',                      width1: 3,                      icon:Icon((Icons.alternate_email),                          color: Stages.typed_email_signin.value.isEmpty                              ? Colors.black                              :  Colorsapp.mainColor),                      maxline: 1,                      onChanged: (text1) {                        Stages.typed_email_signin.value =text1;                      }, pass: false,                    );                  }                ),                    Padding(                      padding: const EdgeInsets.all(8.0),                      child: Container(                        width: MediaQuery.of(context).size.width/3,                        height: MediaQuery.of(context).size.height/45,                        child: Obx(                          () {                            return Stages.error.value ==false ?Text(                              "الايميل غير صحيح",                              textAlign:TextAlign.right,                              style: Text_Style.getstyle(                                  fontsize: MediaQuery.of(context).size.longestSide / 100,                                  ColorText: Colors.red,                                  fontWeight: FontWeight.w700),                            ):Text("");                          }                        ),                      ),                    ),                SizedBox(height: MediaQuery.of(context).size.height / 50,),                Obx(                        () {                    return TextField_1(typed_email: Stages.typed_passowrd_signin, Email:Stages.passowrd_signin , text: 'Passowrd', width1: 3,                      icon: IconButton(                        icon: Icon(                            Stages.swich == true ? Icons.visibility_off : Icons.visibility),                        color: Stages.typed_passowrd_signin.value.isEmpty                            ? Colors.black                            :  Colorsapp.mainColor,                        onPressed: () {                          setState(() {                            if (Stages.swich == false) {                              Stages.swich = true.obs;                            } else {                              Stages.swich = false.obs;                            }                          });                          print(Stages.swich);                        },                      ),                      onChanged: (text2 ) {                        Stages.typed_passowrd_signin.value = text2;                      }, pass: Stages.swich.value,);                  }                ),                Padding(                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height / 15,),                  child: Home_Button_big(                    Text_Button: 'Sign in',                    onPressed: () {                      print("ss${Stages.Email_signin.text}");                      print("isvaled${isValid}");                      print("error${Stages.error}");                      isValid = EmailValidator.validate(Stages.Email_signin.text);                      Stages.error.value = isValid;                      Future.delayed(const Duration(milliseconds: 1000), () {                        Stages.error.value = true;                      });                      print('Email is valid? ' + (isValid ? 'yes' : 'no'));                      if(isValid == true)                        Get.rootDelegate.toNamed(Routes.Home_Page);                      print("isvaled${isValid}");                      print("error${Stages.error}");                    },                      X: 55.obs                  ),                ),              ],            ),          ),          if (MediaQuery.of(context).size.longestSide > 1000)            Padding(              padding: const EdgeInsets.only(left: 100),              child: Image.asset(                "photo/1111.png",                width: MediaQuery.of(context).size.longestSide / 2,                height: MediaQuery.of(context).size.longestSide / 2,              ),            ),        ],      ),    );  }}