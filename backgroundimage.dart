import 'package:flutter/material.dart';

class backgroundimage extends StatelessWidget {
  const backgroundimage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body:
         Container(
           height: double.infinity,
           width: double.infinity,
           child: Image.asset(
             "images/1.jpg",
             color: Colors.black,
             colorBlendMode: BlendMode.colorDodge,
             filterQuality: FilterQuality.high,
             fit: BoxFit.fill,
           ),
         ),
//       Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.topRight,
// end: Alignment.bottomLeft,
// colors:[
// Color(0xFFFF800B),
// Color(0xFFccff99),
// ] )
// ),
//
//         child: Image.asset('images/lfimage.jpg',fit: BoxFit.cover,),
//
//
//
//       ),
    );
  }
}
//height: double.infinity,
// width: double.infinity,
// decoration: BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.topRight,
// end: Alignment.bottomLeft,
// colors:[
// Color(0xFFFF800B),
// Color(0xFFccff99),
// ] )
// ),