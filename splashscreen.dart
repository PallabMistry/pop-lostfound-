import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lostandfound/home.dart';
import 'package:lottie/lottie.dart';



class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:3),
            () {Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => home())
            );});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors:[
                  Color(0xFFFF800B),
                  Color(0xFFccff99),
                ] )
        ),
        child: Center(
          child: Lottie.asset('images/search.json'),
        ),
      ),

    );
  }
}
