import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lostandfound/backgroundimage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  Future<dynamic> exitDialog(){
    return showDialog(
      context: context,
      builder: (context) =>

      AlertDialog(
        title: Text('Are you Sure?'),
        content: Text('Do you want to exit from the app?'),
        actions: [
          FlatButton(onPressed: () {
            SystemNavigator.pop();
          }, child: Text('YES')),
          FlatButton(onPressed: () {
            Navigator.of(context).pop(false);
          }, child: Text('NO')),

        ],
        backgroundColor: Colors.amberAccent,
      ),
    );
  }
  File? singleImage;
  final singlePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exitDialog();
        return Future.value(false);
      },
      child: Stack(
        children: [
          backgroundimage(),
          Scaffold(
            backgroundColor: Colors.transparent,
               appBar: AppBar(
                 backgroundColor: Color(0xff80ffaa),
                  title: Text(
              'Lost & Found',
              style: GoogleFonts.bangers(
                  fontSize: 30.sp, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,

          ),
             body:Container(
               child: Padding(
                 padding: EdgeInsets.all(20.w),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     SizedBox(height: 70.h,),
                     ElevatedButton(
                       onPressed: () {
                         Navigator.pushNamed(context, "/found" );
                       },
                       style: ElevatedButton.styleFrom(
                         primary: Colors.black,
                         onPrimary: Colors.amber,
                         elevation: 20,  // Elevation
                         shadowColor: Colors.amber, // Shadow Color
                       ),
                       child: Text(
                         'Found Item',
                           style: GoogleFonts.bangers(fontSize: 70.sp,)
                       ),
                     ),
                     SizedBox(height: 160.h,width: 80.w,),
                     ElevatedButton(
                       onPressed: () {

                         Navigator.pushNamed(context, "/lost" );
                       },
                       style: ElevatedButton.styleFrom(
                         primary: Colors.lightGreenAccent,
                         onPrimary: Colors.purpleAccent,
                         elevation: 20,  // Elevation
                         shadowColor: Colors.amber, // Shadow Color
                       ),
                       child: Text(
                           'Lost Item',
                           style: GoogleFonts.bangers(fontSize: 70.sp,)
                       ),
                     ),
                   ],
                 ),
               ),
             ) ,

            drawer: Drawer(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(50.50.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                getSingleImage();
                              },
                              child: singleImage == null
                                  ? Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.r),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.grey,
                                    )),
                                width: 100.w,
                                height: 100.h,
                                child: Icon(
                                  CupertinoIcons.camera,
                                  color: Colors.grey,
                                ),
                              )
                                  : Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.r),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.grey,
                                    )),
                                width: 100.w,
                                height: 100.h,
                                child: Image.file(
                                  singleImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],

                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: Colors.greenAccent,
                    child: ListTile(
                      leading: Icon(
                        Icons.threesixty_outlined,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/found" );

                      },
                      title: Text(
                        'Found Item',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.deepOrange,
                    child: ListTile(
                      leading: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/lost" );

                      },
                      title: Text(
                        'Lost Item',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.purpleAccent,
                    child: ListTile(
                      leading: Icon(
                        Icons.account_balance_wallet_rounded,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context,"/registration" );

                        },
                      title: Text(
                        'Register',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                     Card(
                      color: Colors.lightGreenAccent,
                      child: ListTile(
                        leading: Icon(
                          Icons.error_outline,
                          color: Colors.black,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context,"/about" );
                        },
                        title: Text(
                          'About',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                  Card(
                    color: Colors.blueAccent,
                    child: ListTile(
                      leading: Icon(
                        Icons.flag,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context,"/privacy" );

                      },
                      title: Text(
                        'Privacy Police',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
      ),
    );
  }
  Future getSingleImage() async {
    final pickedImage =
    await singlePicker.getImage(source: (ImageSource.gallery));
    setState(() {
      if (pickedImage != null) {
        singleImage = File(pickedImage.path);
      } else {
        print('No Image Selected');
      }
    });
  }

}

