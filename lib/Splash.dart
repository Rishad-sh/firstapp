import 'dart:async';


import 'package:firstapp/siform.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), (() {
      Navigator.push(context, MaterialPageRoute(builder:((context) => SIForm())));
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 236, 22, 7),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 200,
                    child: Image.asset('images/money.png')),
              ),
              Text(
                'Simple Interest Calculator',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 150.0,
              ),
              Container(
                height: 50.0,
                width: 50.0,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
           
            ],
          ),
        ));
  }
}
