// import 'package:flutter/cupertino.dart';// import 'package:flutter/material.dart';// import 'package:get/get_rx/src/rx_types/rx_types.dart';// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';////// import '../../../../../controler/model.dart';// import '../../../../../help/Colors.dart';// import '../Add_student_larg_page/TextField_Add_student1.dart';//// class Column_of_Textfield extends StatelessWidget {//   const Column_of_Textfield({//     Key? key,//     required this.typed_name,//     required this.typed_email,//     required this.typed_passowrd,//   }) : super(key: key);////   final RxString typed_name;//   final RxString typed_email;//   final RxString typed_passowrd;////   @override//   Widget build(BuildContext context) {//     return Container(//       width: MediaQuery.of(context).size.width/1.1,//       child: Column(//         children: [////           Obx(//                   () {//                 return TextField_Add_Student(typed_email: typed_name,//                   Email: Stages.name_add_student,//                   text: 'الاسم:',//                   width1: 1.1,//                   icon:Icon((Icons.school),//                       color: typed_name.value.isEmpty//                           ? Colors.black//                           :  Colorsapp.mainColor),//                   maxline: 1,//                   onChanged: (text1) {//                     typed_name.value =text1;//////                   }, pass: false, margin_left: 0,//                 );//               }//           ),//           Obx(//                   () {//                 return TextField_Add_Student(typed_email: typed_email,//                   Email: Stages.Email_add_student,//                   text: 'الايميل',//                   width1: 1.1,//                   icon:Icon((Icons.alternate_email),//                       color: typed_email.value.isEmpty//                           ? Colors.black//                           :  Colorsapp.mainColor),//                   maxline: 1,//                   onChanged: (text1) {//                     typed_email.value =text1;//////                   }, pass: false, margin_left: 0,//                 );//               }//           ),//           Obx(//                   () {//                 return TextField_Add_Student(typed_email: typed_passowrd,//                   Email: Stages.passowrd_add_student,//                   text: 'الباسورد:',//                   width1:0.2,//                   icon:Icon((Icons.password),//                       color: typed_passowrd.value.isEmpty//                           ? Colors.black//                           :  Colorsapp.mainColor),//                   maxline: 1,//                   onChanged: (text1) {//                     typed_passowrd.value =text1;//////                   }, pass: false, margin_left: 0,//                 );//               }//           ),//////////////         ],//       ),////     );//   }// }