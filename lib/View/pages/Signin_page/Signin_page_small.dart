// import 'package:email_validator/email_validator.dart';// import 'package:firebase_auth/firebase_auth.dart';// import 'package:flutter/cupertino.dart';// import 'package:flutter/material.dart';// import 'package:get/get.dart';// import 'package:get/get_rx/src/rx_types/rx_types.dart';//// import '../../../controler/Routes.dart';// import '../../../controler/method.dart';// import '../../../controler/model.dart';// import '../../../help/Colors.dart';// import '../../../help/text_style.dart';//// import '../FirstPage/Home_Button_small.dart';//// import 'TextField_1.dart';//// class Signin_page_small extends StatefulWidget {//   const Signin_page_small({Key? key}) : super(key: key);////   @override//   State<Signin_page_small> createState() => _Signin_page_smallState();// }//// class _Signin_page_smallState extends State<Signin_page_small> {//   @override//   bool isValid = false;////   Widget build(BuildContext context) {//     return MediaQuery.of(context).size.height > 354//         ? Column(//             mainAxisAlignment: MainAxisAlignment.spaceAround,//             crossAxisAlignment: CrossAxisAlignment.center,//             children: [//               if (MediaQuery.of(context).size.longestSide < 1000)//                 Image.asset(//                   "photo/1111.png",//                   width: MediaQuery.of(context).size.longestSide / 3,//                   height: MediaQuery.of(context).size.longestSide / 3,//                 ),//               Padding(//                 padding: const EdgeInsets.only(bottom: 0),//                 child: Text(//                   "تسجيل الدخول",//                   style: Text_Style.getstyle(//                       fontsize: MediaQuery.of(context).size.longestSide / 20,//                       ColorText: Colorsapp.White,//                       fontWeight: FontWeight.w700),//                 ),//               ),//               Container(//                 child: Column(//                   children: [//                     Obx(() {//                       return TextField_1(//                         typed_email: Stages.typed_email_signin,//                         Email: Stages.Email_signin,//                         text: 'Email',//                         width1: 1.2,//                         icon: Icon((Icons.alternate_email),//                             color: Stages.typed_email_signin.value.isEmpty//                                 ? Colors.black//                                 : Colorsapp.mainColor),//                         onChanged: (text1) {//                           Stages.typed_email_signin.value = text1;//                         },//                         pass: false,//                       );//                     }),//                     Padding(//                       padding: EdgeInsets.only(//                           // bottom: MediaQuery.of(context).size.height/10,//                           right: MediaQuery.of(context).size.width / 15),//                       child: Container(//                         width: MediaQuery.of(context).size.width / 1.1,//                         height: MediaQuery.of(context).size.height / 20,//                         child: Obx(() {//                           return Stages.error.value == false//                               ? Text(//                                   "الايميل غير صحيح",//                                   textAlign: TextAlign.right,//                                   style: Text_Style.getstyle(//                                       fontsize: MediaQuery.of(context)//                                               .size//                                               .longestSide ///                                           50,//                                       ColorText: Colors.red,//                                       fontWeight: FontWeight.w700),//                                 )//                               : Text("");//                         }),//                       ),//                     ),//                     Obx(() {//                       return TextField_1(//                         typed_email: Stages.typed_passowrd_signin,//                         Email: Stages.passowrd_signin,//                         text: 'Passowrd',//                         width1: 1.2,//                         icon: IconButton(//                           icon: Icon(Stages.swich == true//                               ? Icons.visibility_off//                               : Icons.visibility),//                           color: Stages.typed_passowrd_signin.value.isEmpty//                               ? Colors.black//                               : Colorsapp.mainColor,//                           onPressed: () {//                             setState(() {//                               if (Stages.swich == false) {//                                 Stages.swich = true.obs;//                               } else {//                                 Stages.swich = false.obs;//                               }//                             });//                             print(Stages.swich);//                           },//                         ),//                         onChanged: (text2) {//                           Stages.typed_passowrd_signin.value = text2;//                         },//                         pass: Stages.swich.value,//                       );//                     }),//                   ],//                 ),//               ),//               if (MediaQuery.of(context).size.height > 396)//                 Home_Button_small(//                   Text_Button: 'Sign in',//                   onPressed: () async {//                     setState(() {////                     });//                     Stages.flags.value = true;//                     isValid = EmailValidator.validate(//                         Stages.Email_signin.text);//////                     Stages.error.value = isValid;//                     Future.delayed(//                         const Duration(seconds: 2), () async {//                       Stages.flags.value = false;//                       Future.delayed(//                           const Duration(seconds: 3), () {//                         Stages.error.value = true;////////                       });//                       if (isValid == true) {//                         // Methods.AddAdmin(email: Stages.Email_signin.text, passowrd: Stages.passowrd_signin.text,);//                         await Methods.Signin(//                           email: Stages.Email_signin.text,//                           passowrd: Stages.passowrd_signin.text,//                         );//                         if(Methods.emailflgs==true){//                           print("1111111111111${Methods.emailflgs}");//                           print("1111111111111${Methods.passflgs}");////                           Methods.showAlerterror(context , Stages.finaltext);////                         }else  if(Methods.passflgs==true){//                           print("22222222222${Methods.emailflgs}");//                           print("222222222222${Methods.passflgs}");//                           Methods.showAlerterror(context , Stages.finaltext);////                         }else{//                           print("33333333${Methods.emailflgs}");//                           print("33333333333${Methods.passflgs}");//                           Get.rootDelegate.toNamed(Routes.Home_Page);//                           await FirebaseAuth.instance.currentUser?.updateDisplayName("Atheer-AlChalabi");//                           print(FirebaseAuth.instance.currentUser?.email);//                         }////////////                       }//////////////                     });////////////////////                     ///////////////////////////////////////////////////////                     /////////////////////////////////////////////////////                   },//                   X: 30.obs,//                 ),//               Obx(() {//                 return Stages.flags.value==true? Padding(//                   padding: const EdgeInsets.only(top: 0),//                   child: Container(//                       height: 50,//                       width: 50,////                       child: CircularProgressIndicator(//                         color: Colorsapp.SecondColor,//                         strokeWidth: 5,//                       )),//                 ):Padding(//                   padding: const EdgeInsets.only(top: 0),//                   child: Container(  height: 50,//                     width: 50,),//                 );//               }//               )//////////             ],//           )//         : Image.asset(//             "photo/1111.png",//             width: MediaQuery.of(context).size.longestSide / 3,//             height: MediaQuery.of(context).size.longestSide / 3,//           );//   }// }