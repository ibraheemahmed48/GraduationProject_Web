import 'package:cloud_firestore/cloud_firestore.dart';import 'package:file_picker/file_picker.dart';import 'package:firebase_auth/firebase_auth.dart';import 'package:firebase_storage/firebase_storage.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:get/get.dart';import 'package:mime_type/mime_type.dart';import '../help/Colors.dart';import '../help/text_style.dart';import 'Routes.dart';import 'model.dart';class Methods {  static AddAdmin({required email ,required passowrd}) async{    try {      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(        email: email,        password:passowrd,      );    } on FirebaseAuthException catch (e) {      if (e.code == 'weak-password') {        print('The password provided is too weak.');      } else if (e.code == 'email-already-in-use') {        print('The account already exists for that email.');      }    } catch (e) {      print(e);    }  }  static AddNews ({required title , required body ,required image1 ,required auther ,required stage ,required link1})async{    DateTime today = DateTime.now();    String dateStr = "${today.day}-${today.month}-${today.year}-${today.hour}-${today.minute}";    CollectionReference news = FirebaseFirestore.instance.collection("News");    news.doc("News: ${dateStr.toString()}").set({      "Title": title,      "author":auther,      "body": body,      "Images":image1,      "Link": link1,      "Stages": stage ,    });    print("object");  }  static bool passflgs = false;  static bool emailflgs = false;  static Signin({required email ,required passowrd}) async {    try {      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(          email: email,          password: passowrd      );      passflgs = false;      emailflgs = false;      print(credential);    } on  FirebaseAuthException catch (e) {      if (e.code == 'user-not-found') {        print('No user found for that email.');        Stages.finaltext ="لا يوجد حساب";        passflgs = true;      } else if (e.code == 'wrong-password') {        print('Wrong password provided for that user.');        Stages.finaltext ="الباسورد خطأ";        passflgs = true;      }    }}  getdata() async {    print("===========");    CollectionReference News = FirebaseFirestore.instance.collection("News");    QuerySnapshot query = await News.get();    List<QueryDocumentSnapshot> List1 = query.docs;    List1.forEach((element) {      print(element[0]["image"]);      print("===========");    });  }  static upLodeImages() async {    Stages.urlNewsImage="";    Stages.flagsNews.value =false;    print("Stages.bytesData11111${Stages.bytesData1}");    print("ListOFurlNewsImage1 ${Stages.ListOFurlNewsImage}");    final result = await FilePicker.platform.pickFiles(      type: FileType.image,    );    if (result != null) {      var mimeType = mime(result.files.single.name);      final file =await result.files.single.bytes;      Stages.bytesData1 = file;      print("Stages.bytesData11111${Stages.bytesData1}");      var ref = FirebaseStorage.instance.ref("NewsImages").child("${DateTime.now().toString()+result.files.single.name}");      await ref.putData(file!,SettableMetadata(contentType: mimeType?.obs.value.toString()));      Stages.urlNewsImage =await ref.getDownloadURL();      print("url : ${Stages.urlNewsImage}");      Stages.ListOFurlNewsImage.value.add(Stages.urlNewsImage);      print("ListOFurlNewsImage5 ${Stages.ListOFurlNewsImage}");      Future.delayed(const Duration(microseconds: 500), () async {        print("-------------------------------");        Stages.flagsNews.value =true;        print("-------------------------------");      });    } else {      Stages.flagsNews.value =false;      return "null";      // User canceled the picker    }  }  static void showAlert(BuildContext context ,String text) {    showDialog(      context: context,      builder: (BuildContext context) {        return AlertDialog(          title: Text(           textDirection: TextDirection.rtl,            'هناك خطأ',            style:Text_Style.getstyle(fontsize: 25, ColorText: Colorsapp.mainColor, fontWeight: FontWeight.w700),          ),          content: Text(            text,           textDirection: TextDirection.rtl,            style:Text_Style.getstyle(fontsize: 18, ColorText: Colorsapp.mainColor, fontWeight: FontWeight.w700),          ),          actions: <Widget>[            TextButton(              child: Text('OK'),              onPressed: () {                Navigator.of(context).pop();              },            ),          ],        );      },    );  }}