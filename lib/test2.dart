import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';class test2 extends StatefulWidget {  const test2({Key? key}) : super(key: key);  @override  State<test2> createState() => _test2State();}class _test2State extends State<test2> {  @override  Widget build(BuildContext context) {    return Scaffold(      backgroundColor: Colors.lightBlueAccent,      body: SafeArea(        child: Center(        child: Text("ssssss"),        ),      ),    );  }}