import 'package:email_validator/email_validator.dart';import 'package:firebase_auth/firebase_auth.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:get/get.dart';import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';import 'package:loading_animation_widget/loading_animation_widget.dart';import '../../../controler/Routes.dart';import '../../../controler/method.dart';import '../../../controler/model.dart';import '../../../help/Colors.dart';import '../../../help/text_style.dart';import '../FirstPage/Home_Button_big.dart';import '../FirstPage/Home_Button_small.dart';import 'TextField_1.dart';class Signin_page_large extends StatefulWidget {  const Signin_page_large({Key? key}) : super(key: key);  @override  State<Signin_page_large> createState() => _Signin_page_largeState();}class _Signin_page_largeState extends State<Signin_page_large> {  @override  void initState() {    print("******************************************************************************************");    super.initState();  } bool isValid = false;  @override  Widget build(BuildContext context) {    return MediaQuery.of(context).size.height > 230        ? SingleChildScrollView(          child: Padding(            padding: EdgeInsets.only(              left: MediaQuery.of(context).size.width / 50,            ),            child: Row(              mainAxisAlignment: MediaQuery.of(context).size.width>1000?MainAxisAlignment.start:MainAxisAlignment.center,              children: [                SizedBox(                  width: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.width>1000?3:1.2),                  height: MediaQuery.of(context).size.height,                  child: Column(                    mainAxisAlignment: MainAxisAlignment.center,                    crossAxisAlignment: CrossAxisAlignment.center,                    children: [                      if (MediaQuery.of(context).size.longestSide < 1000)                        Image.asset(                          "photo/1111.png",                          width: MediaQuery.of(context).size.longestSide / 4,                          height: MediaQuery.of(context).size.longestSide / 4,                        ),                      Column(                        mainAxisAlignment: MainAxisAlignment.center,                        crossAxisAlignment: CrossAxisAlignment.center,                        children: [                          if (MediaQuery.of(context).size.longestSide > 1000)                            SizedBox(height: 150,),                          Padding(                            padding: EdgeInsets.only(                                bottom: MediaQuery.of(context).size.height / 25),                            child: Text(                              "تسجيل الدخول",                              style: Text_Style.getstyle(                                  fontsize: MediaQuery.of(context).size.longestSide / (MediaQuery.of(context).size.width>1000?40:20),                                  ColorText: MediaQuery.of(context).size.width>1000?Colorsapp.mainColor:Colorsapp.White,                                  fontWeight: FontWeight.w700),                            ),                          ),                        ],                      ),                      Obx(() {                        return TextField_1(                          typed_email: Stages.typed_email_signin,                          Email: Stages.Email_signin,                          text: 'Email',                          width1: MediaQuery.of(context).size.width>1000?3:1.2,                          icon: Icon((Icons.alternate_email),                              color: Stages.typed_email_signin.value.isEmpty                                  ? Colors.grey                                  : Colorsapp.mainColor),                          maxline: 1,                          onChanged: (text1) {                            Stages.typed_email_signin.value = text1;                          },                          pass: false,                        );                      }),                      Align(                        alignment: Alignment.centerRight,                        child: Padding(                          padding: const EdgeInsets.all(5.0),                          child: Container(                            width: MediaQuery.of(context).size.width / 3,                            height: MediaQuery.of(context).size.height / 35,                            child: Obx(() {                              return Stages.error.value == false                                  ? Text(                                "الايميل غير صحيح",                                textAlign: TextAlign.right,                                style: Text_Style.getstyle(                                    fontsize: MediaQuery.of(context).size.longestSide / (MediaQuery.of(context).size.width>1000?100:50),                                    ColorText: Colors.red,                                    fontWeight: FontWeight.w700),                              )                                  : Text("");                            }),                          ),                        ),                      ),                      SizedBox(                        height: MediaQuery.of(context).size.height / 40,                      ),                      Obx(() {                        return TextField_1(                          typed_email: Stages.typed_passowrd_signin,                          Email: Stages.passowrd_signin,                          text: 'Passowrd',                          width1: MediaQuery.of(context).size.width>1000?3:1.2,                          icon: IconButton(                            icon: Icon(Stages.swich == true                                ? Icons.visibility_off                                : Icons.visibility),                            color: Stages.typed_passowrd_signin.value.isEmpty                                ? Colors.grey                                : Colorsapp.mainColor,                            onPressed: () {                              setState(() {                                if (Stages.swich == false) {                                  Stages.swich = true.obs;                                } else {                                  Stages.swich = false.obs;                                }                              });                              print(Stages.swich);                            },                          ),                          onChanged: (text2) {                            Stages.typed_passowrd_signin.value = text2;                          },                          pass: Stages.swich.value,                        );                      }),                      if (MediaQuery.of(context).size.height > 305)                        Padding(                          padding: EdgeInsets.only(                            top: MediaQuery.of(context).size.height / 15,                          ),                          child: MediaQuery.of(context).size.width>1000?Home_Button_big(                            Text_Button: 'تسجيل دخول',                            onPressed: () async {                              print("------------------------onPressed----------------------------------");                              Stages.flagsSignin.value = true;                              isValid = await EmailValidator.validate(                                  Stages.Email_signin.text);                              Stages.error.value = isValid;                              Future.delayed(                                  const Duration(seconds: 1), () async {                                Stages.flagsSignin.value = false;                                Future.delayed(                                    const Duration(seconds: 3), () {                                  Stages.error.value = true;                                });                                if (isValid == true) {                                  Methods.emailExists.value = await Methods.checkEmailExists(Stages.Email_signin.text);                                  if(Methods.emailExists.value==true){                                    await Methods.Signin(                                      email: Stages.Email_signin.text,                                      passowrd: Stages.passowrd_signin.text,                                    );                                    if(Methods.emailflgs==true){                                      print("1111111111111${Methods.emailflgs}");                                      print("1111111111111${Methods.passflgs}");                                      Methods.showAlerterror(context , Stages.finaltext);                                    }else  if(Methods.passflgs==true){                                      print("22222222222${Methods.emailflgs}");                                      print("222222222222${Methods.passflgs}");                                      Methods.showAlerterror(context , Stages.finaltext);                                    }else{                                      Methods.EmailSigin=Stages.Email_signin.text;                                      Methods.PasswordSigin=Stages.passowrd_signin.text;                                      print("33333333${Methods.emailflgs}");                                      print("33333333333${Methods.passflgs}");                                      Get.rootDelegate.offNamed(Routes.Home_Page);                                      print("Methods.EmailSigin : ${Methods.EmailSigin}");                                      print("Methods.PasswordSigin : ${Methods.PasswordSigin}");                                      print(FirebaseAuth.instance.currentUser?.displayName);                                    }                                  }else{                                    Methods.showAlerterror(context ,"هذا الايميل غير موجود");                                  }                                }                              });                              ///////////////////////////////////////////////////                            },                            X: 55.obs, width: 4.obs,):                          Home_Button_small(                              Text_Button: 'تسجيل دخول',                              onPressed: () async {                                print("------------------------onPressed----------------------------------");                                Stages.flagsSignin.value = true;                                isValid = EmailValidator.validate(                                    Stages.Email_signin.text);                                Stages.error.value = isValid;                                Future.delayed(                                    const Duration(seconds: 2), () async {                                  Stages.flagsSignin.value = false;                                  Future.delayed(                                      const Duration(seconds: 3), () {                                    Stages.error.value = true;                                  });                                  if (isValid == true) {                                    Methods.emailExists.value = await Methods.checkEmailExists(Stages.Email_signin.text);                                    if(Methods.emailExists.value==true){                                      await Methods.Signin(                                        email: Stages.Email_signin.text,                                        passowrd: Stages.passowrd_signin.text,                                      );                                      if(Methods.emailflgs==true){                                        print("1111111111111${Methods.emailflgs}");                                        print("1111111111111${Methods.passflgs}");                                        Methods.showAlerterror(context , Stages.finaltext);                                      }else  if(Methods.passflgs==true){                                        print("22222222222${Methods.emailflgs}");                                        print("222222222222${Methods.passflgs}");                                        Methods.showAlerterror(context , Stages.finaltext);                                      }else{                                        Methods.EmailSigin=Stages.Email_signin.text;                                        Methods.PasswordSigin=Stages.passowrd_signin.text;                                        print("33333333${Methods.emailflgs}");                                        print("33333333333${Methods.passflgs}");                                        Get.rootDelegate.toNamed(Routes.Home_Page);                                        print("Methods.EmailSigin : ${Methods.EmailSigin}");                                        print("Methods.PasswordSigin : ${Methods.PasswordSigin}");                                        print(FirebaseAuth.instance.currentUser?.displayName);                                      }                                    }else{                                      Methods.showAlerterror(context ,"هذا الايميل غير موجود");                                    }                                  }                                });                                ///////////////////////////////////////////////////                                ///////////////////////////////////////////////////                              },                              X:MediaQuery.of(context).size.width > 1000                                  ? 55.obs                                  : 40.obs),                        ),                      Obx(() {                        return Stages.flagsSignin.value==true? Padding(                          padding: const EdgeInsets.only(top: 30),                          child: Container(                            height: 50,                            width: 50,                            child: LoadingAnimationWidget.flickr(                              leftDotColor: MediaQuery.of(context).size.width>1000?Colorsapp.mainColor:Colorsapp.White,                              rightDotColor: Colorsapp.SecondColor, size: 100,                              //color: Colorsapp.mainColor,                            ),                          ),                        ):Padding(                          padding: const EdgeInsets.only(top: 50),                          child: Container(                            height: 0,                            width: 50,),                        );                      }                      ),                      if(Stages.flagsSignin.value==false)                        Text(                          "MTCE",                          style: Text_Style.getstyle(                              fontsize: MediaQuery.of(context).size.longestSide / (MediaQuery.of(context).size.width>1000?35:20),                              ColorText: MediaQuery.of(context).size.width>1000?Colorsapp.mainColor:Colorsapp.White,                              fontWeight: FontWeight.w700),                        ),                    ],                  ),                ),                if (MediaQuery.of(context).size.longestSide > 1000)                  Padding(                    padding: const EdgeInsets.only(left: 100),                    child: Image.asset(                      "photo/1111.png",                      width: MediaQuery.of(context).size.longestSide / 2,                      height: MediaQuery.of(context).size.longestSide / 2,                    ),                  ),              ],            ),          ),        )        : Image.asset(            "photo/1111.png",            width: MediaQuery.of(context).size.longestSide / 2,            height: MediaQuery.of(context).size.longestSide / 2,          );  }}