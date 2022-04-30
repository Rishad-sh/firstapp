// ignore_for_file: deprecated_member_use
import 'package:firstapp/Splash.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/siform.dart';
void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Simple Interest Calculator App',
      home: Splash(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo, 
        // ignore: deprecated_member_use
        accentColor: Colors.indigoAccent
      ),
    )
  );
}

