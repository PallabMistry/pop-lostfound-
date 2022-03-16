import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lostandfound/backgroundimage.dart';
import 'package:lostandfound/found.dart';
import 'package:lostandfound/home.dart';
import 'package:lostandfound/login.dart';
import 'package:lostandfound/lost.dart';
import 'package:lostandfound/registration.dart';
import 'package:lostandfound/sp.dart';
import 'package:lostandfound/splashscreen.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
         builder:()=>MaterialApp(
           initialRoute: "/",
        routes:{
             login.route:(context)=>login(),
          registration.route:(context)=>registration(),
          found.route:(context)=>found(),
          lost.route:(context)=>lost(),
          about.route:(context)=>about(),
          privacy.route:(context)=>privacy(),


        } ,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
            home:registration(),
    ),
      );
  }
}

