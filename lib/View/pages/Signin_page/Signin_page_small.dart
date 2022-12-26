import 'package:email_validator/email_validator.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:get/get.dart';import 'package:get/get_rx/src/rx_types/rx_types.dart';import '../../../help/Colors.dart';import '../../../help/text_style.dart';import '../FirstPage/Home_Button_big.dart';import '../FirstPage/Home_Button_small.dart';import '../controler/Routes.dart';import '../controler/model.dart';import 'Signin_main_page.dart';import 'TextField_1.dart';class Signin_page_small extends StatefulWidget {  const Signin_page_small({Key? key}) : super(key: key);  @override  State<Signin_page_small> createState() => _Signin_page_smallState();}class _Signin_page_smallState extends State<Signin_page_small> {  @override  bool isValid = false;  final _formKey = GlobalKey<FormState>();  final TextEditingController _emailController = new TextEditingController();  Widget build(BuildContext context) {    return Row(      mainAxisAlignment: MainAxisAlignment.center,      children: [        Column(          mainAxisAlignment: MainAxisAlignment.spaceEvenly,          crossAxisAlignment: CrossAxisAlignment.center,          children: [            if (MediaQuery.of(context).size.longestSide < 1000)              Image.asset(                "photo/1111.png",                width: MediaQuery.of(context).size.longestSide / 2.5,                height: MediaQuery.of(context).size.longestSide / 2.5,              ),            Padding(              padding: const EdgeInsets.only(bottom: 50),              child: Text(                "تسجيل دخول",                style: Text_Style.getstyle(                    fontsize: MediaQuery.of(context).size.longestSide / 20,                    ColorText: Colorsapp.White,                    fontWeight: FontWeight.w700),              ),            ),            Obx(               () {                return TextField_1(                  typed_email: Stages.typed_email_signin,                  Email: Stages.Email_signin,                  text: 'Email',                  width1: 1.2,                  icon: Icon((Icons.alternate_email),                      color: Stages.typed_email_signin.value.isEmpty                          ? Colors.black                          : Colorsapp.mainColor),                  onChanged: (text1) {                    Stages.typed_email_signin.value = text1;                  }, pass: false,                );              }            ),            Padding(              padding:  EdgeInsets.only(                 // bottom: MediaQuery.of(context).size.height/10,                  right: MediaQuery.of(context).size.width/15),              child: Container(                width: MediaQuery.of(context).size.width/1.1,                height: MediaQuery.of(context).size.height/20,                child: Obx(                        () {                      return Stages.error.value ==false ?Text(                        "الايميل غير صحيح",                        textAlign:TextAlign.right,                        style: Text_Style.getstyle(                            fontsize: MediaQuery.of(context).size.longestSide / 50,                            ColorText: Colors.red,                            fontWeight: FontWeight.w700),                      ):Text("");                    }                ),              ),            ),            Obx(                    () {                return TextField_1(                    typed_email: Stages.typed_passowrd_signin,                    Email: Stages.passowrd_signin,                    text: 'Passowrd',                    width1: 1.2,                    icon: IconButton(                      icon: Icon(                          Stages.swich == true ? Icons.visibility_off : Icons.visibility),                      color: Stages.typed_passowrd_signin.value.isEmpty                          ? Colors.black                          :  Colorsapp.mainColor,                      onPressed: () {                        setState(() {                          if (Stages.swich == false) {                            Stages.swich = true.obs;                          } else {                            Stages.swich = false.obs;                          }                        });                        print(Stages.swich);                      },                    ),                    onChanged: (text2) {                      Stages.typed_passowrd_signin.value = text2;                    }, pass: Stages.swich.value,);              }            ),            Home_Button_small(              Text_Button: 'Sign in',              onPressed: () {                print("ss${Stages.Email_signin.text}");                isValid = EmailValidator.validate(Stages.Email_signin.text);                Stages.error.value = isValid;                Future.delayed(const Duration(milliseconds: 1000), () {                  Stages.error.value = true;                });                print('Email is valid? ' + (isValid ?"yes" : 'no'));                if(isValid == true)                  Get.rootDelegate.toNamed(Routes.Home_Page);              }, X: 30.obs,            )          ],        ),      ],    );  }}