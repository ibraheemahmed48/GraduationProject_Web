import 'dart:convert';import 'dart:io';import 'dart:typed_data';import 'package:cloud_firestore/cloud_firestore.dart';import 'package:dotted_border/dotted_border.dart';import 'package:file_picker/file_picker.dart';import 'package:firebase_auth/firebase_auth.dart';import 'package:firebase_storage/firebase_storage.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:flutter_dropzone/flutter_dropzone.dart';import 'package:get/get.dart';import 'dart:html' as html;import 'package:http/http.dart' as http;import 'package:http/http.dart';import 'package:loading_animation_widget/loading_animation_widget.dart';import 'package:mime_type/mime_type.dart';import 'package:notificationsystem/controler/method.dart';import 'package:notificationsystem/test.dart';import 'package:percent_indicator/circular_percent_indicator.dart';import '../../../../../controler/model.dart';import '../../../../../help/Colors.dart';import '../../../../../help/text_style.dart';import 'Row_of_Button_stages.dart';import 'package:firebase_storage_web/firebase_storage_web.dart';class Add_Stages_larg_page extends StatefulWidget {  const Add_Stages_larg_page({Key? key}) : super(key: key);  @override  State<Add_Stages_larg_page> createState() => _Add_Stages_larg_pageState();}class _Add_Stages_larg_pageState extends State<Add_Stages_larg_page> {///////////////////////////////////////////////////////////////////  PlatformFile? _selectedFile;  List<Map<String, dynamic>> _data = [];  static bool _isLoading = false;  Future<void> _selectFile() async {    final result = await FilePicker.platform.pickFiles(      type: FileType.custom,      allowedExtensions: ['csv'],    );    if (result == null) {      return;    }    setState(() {      _selectedFile = result.files.single;      print(_selectedFile.runtimeType);      _data = [];    });  }  Future<void> _uploadFile() async {    setState(() {      _isLoading = true;    });    print("////////////try/////////////");    if (Methods.add_stages == "") {      Methods.showAlerterror(context, "لم يتم تحديد مرحلة");      _isLoading = false;    } else if (_selectedFile == null) {      Methods.showAlerterror(context, "لم يتم تحديد ملف");      _isLoading = false;    } else {      try {      var mimeType = mime(_selectedFile?.name);        final fileName = _selectedFile?.name;        final ref = FirebaseStorage.instance.ref("${fileName}");        final task = ref.putData(_selectedFile!.bytes!,            SettableMetadata(contentType: mimeType?.obs.value.toString()));        print("////////////111/////${_selectedFile!.bytes!.runtimeType}");        final snapshot = await task.whenComplete(() {});        print("////////////222/////////////");        final url = await snapshot.ref.getDownloadURL();        print("////////////333/////////////");        await _readData(url);        print("////////////444/////////////");        await _writeData();        print("////////////3334/////////////");      } catch (e) {        Methods.showAlerterror(context, "لم يتم رفع ملف");      print('Error uploading file: $e');    } finally {      setState(()  {         getStudent();         _isLoading=false;         if(_isLoading==false)         Methods.showAlertDONE(context, "تم الرفع بنجاح");       print("MethodsEmail ${Methods.EmailSigin??"Empty"} ");         print("MethodsPasswordSigin ${Methods.PasswordSigin??"Empty"} ");          Future.delayed(Duration(seconds: 3),() async {            await FirebaseAuth.instance.signOut();            print(" after  signOut Email is  LOGIN : ${FirebaseAuth.instance.currentUser?.email.toString()}");            print("Methods.EmailSigin : ${Methods.EmailSigin}");            print("Methods.PasswordSigin : ${Methods.PasswordSigin}");            print(" befor Signin Email is  LOGIN : ${FirebaseAuth.instance.currentUser?.email.toString()}");            await Methods.Signin(email: Methods.EmailSigin, passowrd: Methods.PasswordSigin);            print(" ather Signin Email is  LOGIN : ${FirebaseAuth.instance.currentUser?.email.toString()}");          });      });    }    }  }  Future<void> _readData(String url) async {    print("object11111111111111111111111111111111111111111111");    print(url);    final response = await http.get(Uri.parse(url));    print("response:${response}");    print("object1111111111333333333333333333111111111");    final lines = const LineSplitter().convert(utf8.decode(response.bodyBytes));    final headers = lines[0].split(',');    setState(() {      _data = List.generate(        lines.length - 1,            (i) => Map.fromIterables(          headers,          lines[i + 1].split(','),        ),      );    });  }  Future<void> _writeData() async {    print(Methods.add_stages);    final batch = FirebaseFirestore.instance.batch();    for (final record in _data) {      final docRef = FirebaseFirestore.instance.collection("Student").doc();      batch.set(docRef, record);    }    await batch.commit().whenComplete(() =>    {      print("***********Complete*************")    });  }  static var mySet = <String>{}.obs;  static RxList StudentList = [].toSet().toList().obs;  static RxBool post = false.obs;  static int i =0;  static int J =0;  static getStudent() async {    post.value = false;    CollectionReference Student =    FirebaseFirestore.instance.collection("Student");    StudentList = [].obs;    QuerySnapshot query =    await Student.get().whenComplete(() => {post.value = true});    StudentList = query.docs.obs;    for (i=0; i<StudentList.length;i++)  {      print("****************");      print("StudentList.length:${i}");      print("email: ${StudentList[i]["email"]}");      print("name: ${StudentList[i]["name"]}");    }  }/////////////////////////////////////////////////////////////////////  @override  Widget build(BuildContext context) {    return Row(      mainAxisAlignment: MediaQuery.of(context).size.longestSide > 1000?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,      children: [        Padding(          padding:  EdgeInsets.only(left: MediaQuery.of(context).size.longestSide > 1000?50:0, top: 10),          child: Container(            //color: Colors.red,            height: MediaQuery.of(context).size.height,            child: ScrollConfiguration(              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),              child: SingleChildScrollView(                child: Column(                  mainAxisAlignment: MainAxisAlignment.center,                  children: [                    if (MediaQuery.of(context).size.longestSide < 1000)                      Image.asset(                        "photo/1111.png",                        width: MediaQuery.of(context).size.longestSide / 4,                        height: MediaQuery.of(context).size.longestSide / 4,                      ),                    Padding(                      padding: const EdgeInsets.symmetric(vertical: 30),                      child: Text(                        "أضافة مرحلة",                        style: Text_Style.getstyle(                            fontsize: MediaQuery.of(context).size.longestSide > 1000?MediaQuery.of(context).size.longestSide / 30:MediaQuery.of(context).size.longestSide / 20,                            ColorText: MediaQuery.of(context).size.longestSide > 1000?Colorsapp.mainColor:Colorsapp.SecondColor,                            fontWeight: FontWeight.w700),                      ),                    ),                    Padding(                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.longestSide > 1000?70:0),                      child: GestureDetector(                          onDoubleTap:_selectFile,                          child: DottedBorder(                            dashPattern: [10, 4],                            strokeWidth: 3,                            color: MediaQuery.of(context).size.longestSide > 1000?Colorsapp.mainColor:Colors.white,                            strokeCap: StrokeCap.butt,                            borderType: BorderType.RRect,                            radius: Radius.circular(5),                            child: Padding(                              padding: const EdgeInsets.all(8.0),                              child: Container(                                width: MediaQuery.of(context).size.width / 2,                                height: 150,                                color: MediaQuery.of(context).size.longestSide > 1000?null:Colors.white,                                child: Stack(                                  children: [                                    //buildZone1(context),                                    Column(                                      mainAxisAlignment:                                          MainAxisAlignment.spaceAround,                                      children: [                                        Text(                                          "ارفاق ملف",                                          style: Text_Style.getstyle(                                              fontsize: MediaQuery.of(context).size.longestSide > 1000?MediaQuery.of(context).size.longestSide / 70:MediaQuery.of(context).size.longestSide / 40,                                              ColorText:Colorsapp.mainColor,                                              fontWeight: FontWeight.w700),                                        ),                                        _isLoading ? LoadingAnimationWidget.flickr(                                          size: 80,                                          leftDotColor: Colorsapp.mainColor,                                          rightDotColor: Colorsapp.SecondColor,                                          //color: Colorsapp.mainColor,                                        ):Image.asset("photo/excel-file.png"),                                        Center(                                            child: Text(                                              _selectedFile == null?Stages.message3:'Selected file: ${_selectedFile?.name}',                                          style: Text_Style.getstyle(                                              fontsize: MediaQuery.of(context).size.longestSide > 1000?MediaQuery.of(context).size.longestSide / 70:MediaQuery.of(context).size.longestSide / 60,                                              ColorText:Colorsapp.mainColor,                                              fontWeight: FontWeight.w500),                                        )),                                      ],                                    ),                                  ],                                ),                              ),                            ),                          )),                    ),                    Padding(                      padding: const EdgeInsets.symmetric(vertical: 30),                      child: Text(                        "اختيار المرحلة الدراسية ",                        style: Text_Style.getstyle(                            fontsize: MediaQuery.of(context).size.longestSide > 1000?MediaQuery.of(context).size.longestSide / 40:MediaQuery.of(context).size.longestSide / 30,                            ColorText: MediaQuery.of(context).size.longestSide > 1000?Colorsapp.mainColor:Colors.white,                            fontWeight: FontWeight.w700),                      ),                    ),                    Row_of_Button_stages(),                    Padding(                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.longestSide > 1000?60:20),                      child: Container(                          width: MediaQuery.of(context).size.width / 5,                          height: 60,                          child: ElevatedButton(                            style: ElevatedButton.styleFrom(                              backgroundColor: Colorsapp.greenColor,                              shape: RoundedRectangleBorder(                                  borderRadius: BorderRadius.circular(18)),                            ),                            onPressed:_uploadFile,                            child: Padding(                              padding: const EdgeInsets.only(top: 7),                              child: Text(                                "اضافة",                                style: Text_Style.getstyle(    fontsize: MediaQuery.of(context).size.longestSide > 1000?MediaQuery.of(context).size.width / 50:MediaQuery.of(context).size.width / 25,                                    ColorText: MediaQuery.of(context).size.longestSide > 1000?Colors.white:Colors.white,                                    fontWeight: FontWeight.w800),                              ),                            ),                          )),                    ),                  ],                ),              ),            ),          ),        ),        if (MediaQuery.of(context).size.longestSide > 1000)          Column(            children: [              Image.asset(                "photo/1111.png",                width: MediaQuery.of(context).size.longestSide / 2.5,                height: MediaQuery.of(context).size.longestSide / 2.5,              ),              Row(                mainAxisAlignment: MainAxisAlignment.spaceBetween,                children: [                  Text(                    "SWAP",                    style: Text_Style.getstyle(                        fontsize: MediaQuery.of(context).size.height / 20,                        ColorText: Colorsapp.White,                        fontWeight: FontWeight.w500),                  ),                  Icon(                    Icons.arrow_forward,                    color: Colorsapp.White,                    size: 30,                  ),                ],              ),            ],          ),      ],    );  }  // Widget buildZone1(BuildContext context) => Builder(  //       builder: (context) => DropzoneView(  //         operation: DragOperation.copy,  //         cursor: CursorType.grab,  //         onCreated: (ctrl) => Stages.controller1 = ctrl,  //         onLoaded: () => print('Zone 1 loaded'),  //         onError: (ev) => print('Zone 1 error: $ev'),  //         onHover: () {  //           setState(() => Stages.highlighted1 = true);  //           print('Zone 1 hovered');  //         },  //         onLeave: () {  //           setState(() => Stages.highlighted1 = false);  //           print('Zone 1 left');  //         },  //         onDrop: (ev) async {  //           print('Zone 1 drop: ${ev.name}');  //           setState(() {  //             Stages.message3 = '${ev.name} '.substring(0, 10);  //             Stages.highlighted1 = false;  //           });  //           final bytes = await Stages.controller1!.getFileData(ev);  //           print(bytes.runtimeType);  //           Stages.bytesData1 = bytes;  //         },  //         onDropMultiple: (ev) async {  //           print('Zone 1 drop multiple: $ev');  //         },  //       ),  //     );  // Widget buildZone2(BuildContext context) => Builder(  //       builder: (context) => DropzoneView(  //         operation: DragOperation.move,  //         onCreated: (ctrl) => Stages.controller2 = ctrl,  //         onLoaded: () => print('Zone 2 loaded'),  //         onError: (ev) => print('Zone 2 error: $ev'),  //         onHover: () => print('Zone 2 hovered'),  //         onLeave: () => print('Zone 2 left'),  //         onDrop: (ev) {  //           print('Zone 2 drop: ${ev.name}');  //           setState(() {  //             Stages.message2 = '${ev.name} dropped';  //           });  //           final stream = Stages.controller2!.getFileStream(ev);  //           print(stream.take(20));  //         },  //         onDropMultiple: (ev) async {  //           print('Zone 2 drop multiple: $ev');  //         },  //       ),  //     );}