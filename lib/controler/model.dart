import 'dart:typed_data';import 'package:flutter/cupertino.dart';import 'package:flutter_dropzone/flutter_dropzone.dart';import 'package:get/get_rx/src/rx_types/rx_types.dart';class Stages {  static RxBool flagsScheduleserror = false.obs;  static RxBool CircularProgressflag = false.obs;  static RxBool flagsSchedules1 = false.obs;  static RxBool flagsSchedules2 = false.obs;  static RxBool flags = false.obs;  static RxBool flagsSignin = false.obs;  static RxBool setflags= false.obs;  static  String Uplode_Schedules_stages  = "";  static String typeofSchedules = "";  static RxBool flagserrorNEWS1 = false.obs;  static List stagesUplode = ["First", "Second", "Third", "Fourth"];  static List stages = ["الاولى", "الثانية", "الثالثة", "الرابعة"];   static List stagesNews=[];  static List stagesNewsUplode=[];  static String stagesSchedules ="";  static List button_clicked_news = [false, false, false, false];   static List button_clicked_Schedules= [false, false, false, false];  static List button_clicked_type= [false, false, false, false];  static List button_clicked_add_Stages= [false, false, false, false];   static List button_clicked_Add_student= [false, false, false, false];   static List button_clicked_Delete_student= [false, false, false, false];   //final String student;   // final String studentEmail;   // final String studentPassword;'   static TextEditingController news1 = TextEditingController(text: "");   static TextEditingController news_Link = TextEditingController(text: "");   static final RxString typed_Link = ''.obs;   static TextEditingController news_title = TextEditingController(text: "");   static final RxString typed_title  = ''.obs;   static TextEditingController add_Schedules = TextEditingController(text: "");   static TextEditingController Email_signin = TextEditingController();   static TextEditingController passowrd_signin = TextEditingController();  static TextEditingController Email_Adduser = TextEditingController();  static TextEditingController passowrd_Adduser = TextEditingController();  static TextEditingController name_Adduser = TextEditingController();  static final RxString typed_email_Adduser  = ''.obs;  static final RxString typed_passowrd_Adduser  = ''.obs;  static final RxString typed_name_Adduser  = ''.obs;  static RxBool flagsAdduser = false.obs;  static RxBool errorAdduser1 = false.obs;  static RxBool errorAdduser2 = false.obs;  static String alartADDuser="";  static TextEditingController Email_add_student = TextEditingController();   static TextEditingController name_add_student = TextEditingController();   static TextEditingController passowrd_add_student = TextEditingController();   static TextEditingController Email_Delete_student = TextEditingController();   /////اضافة طالب   static final RxString typed_email = ''.obs;   static final RxString typed_passowrd = ''.obs;   static final RxString typed_name = ''.obs;   static final RxString typed_Delete_email = ''.obs;   static RxBool swich = true.obs;   static final RxString typed_email_signin = ''.obs;   static final RxString typed_passowrd_signin = ''.obs;  static RxBool error = true.obs;  static String urlNewsImage ="";  static String urlSchedulesImage ="";  static RxList ListOFurlNewsImage =[].obs;  static String text1 ="العنوان فارغ";  static String text2 ="الخبر فارغ";  static String text3 ="العنوان والخبر فارغ";  static String text4 ="لم يتم تحديد مرحلة";  static String finaltext ="";  static RxBool flagsNews=false.obs;  static DropzoneViewController? controller1;  static DropzoneViewController? controller2;  static String message1 = 'Double click to Add Images';   static String message3 = 'Double click or drag drop Drop your Excel file ';   static String message2 = 'Drop something here';  static bool highlighted1 = false;  static List<int>? _selectedFile;  static Uint8List? bytesData1;  static RxList NewsList=[].obs;  //Stages(this.stages,this.button_clicked, this.student, this.studentEmail, this.studentPassword)/////////////////////  static List  list_ofimage=["","photo/test2.png","photo/test3.jpg"];  static List  list_of_Text=[    "الى المرحلة الرابعة/ الخميس القادم الذهاب الى الجامعة في الكرادة لحضور ورشة (اجبارية) حسب تبليغ الجامعة بذلك، لذلك يعتبر الحضور هنالك محسوب ضمن الغيابات.",    "السلام عليكم ستقام غدا يوم الثلاثاء المصاد 8/11/2022  ورشة عمل  بعنوانكتابة تقارير المواد الدراسية ومشاريع التخرجيلقيها  الدكتور طيف علي مهدي  في تمام الساعه الثانية عشر ظهرا على قاعة رقم (3) .املين  تحفيز طلابكم للمرحله الرابعه للقسمين لحضور الورشه...مع التقديرشعبة الشؤون العلمي",    "طلبة العبور من المرحلة الثانية الى الثالثة في مادة الشبكات.الانضمام ايضا الى الصف☝️☝️☝️"];  static List  list_of_link = ["https://pub.dev/packages/auto_size_text/example",    "https://github.com/",    "https://pub.dev/packages/url_launcher/example"];}class Student_Stages {   List stages = ["الاولى", "الثانية ", "الثالثة", "الرابعة"];   List stages_Clicked = [false, false, false, false];   final String studentNmae;   final String studentEmail;   final String studentPassword;   Student_Stages(this.stages , this.stages_Clicked,this.studentEmail,this.studentNmae,this.studentPassword);   static List<Student_Stages> Student_StagesList = [   ];}// Container(//   width: MediaQuery.of(context).size.width / 7,//   height: MediaQuery.of(context).size.height / 12,//   child: ElevatedButton(//     style: ElevatedButton.styleFrom(//       backgroundColor: Colorsapp.mainColor,//       shape: RoundedRectangleBorder(//           borderRadius: BorderRadius.circular(18)),//     ),//     onPressed: () async {//       //upLodeFile();//       print(await controller1.pickFiles(mime: ['image/jpeg', 'image/png']));//     },//     child: Text(//       "ارفاق صورة",//       style: Text_Style.getstyle(//           fontsize://               MediaQuery.of(context).size.longestSide / 70,//           ColorText: Colorsapp.White,//           fontWeight: FontWeight.w700),//     ),//   ),// ),