import 'package:flutter/material.dart';

class about extends StatelessWidget {
  const about({Key? key}) : super(key: key);
  static const String route="/about";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),centerTitle: true,leading: IconButton(onPressed: () {
        Navigator.pushNamed(context,"/home");
      }, icon: Icon(Icons.arrow_back_outlined)),backgroundColor: Colors.greenAccent,),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Text('About this App: \n\n 1.An application, also referred to as an application program or application software, is a computer software package that performs a specific function directly for an end user or, in some cases, for another application. An application can be self-contained or a group of programs. The program is a set of operations that runs the application for the user.\n\n'
           ' 2.Application examples:\n\n'
           ' *** Some types of applications include:\n'

            '-Word processors\n'
           ' -Database programs\n'
            '-Web browsers\n'
            '-Deployment tools\n'
            '-Image editors\n'
            '-Communication platforms\n'
            '-Applications use the computers operating system (OS) and other supporting programs, typically system software, to function. An application requests services from and communicates with other technologies via an application programming interface (API).',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
      ),
      
    );
  }
}



class privacy extends StatelessWidget {
  const privacy({Key? key}) : super(key: key);
  static const String route="/privacy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Privacy Police',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),centerTitle: true,leading: IconButton(onPressed: () {
        Navigator.pushNamed(context,"/home");
      }, icon: Icon(Icons.arrow_back_outlined)),backgroundColor: Colors.orangeAccent,),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Text('An application, also referred to as an application program or application software, is a computer software package that performs a specific function directly for an end user or, in some cases, for another application. An application can be self-contained or a group of programs. The program is a set of operations that runs the application for the user.'
            ' Application examples'
            ' Some types of applications include:'

            'Word processors'
            ' Database programs'
            'Web browsers'
            'Deployment tools'
            'Image editors'
            'Communication platforms'
            'Applications use the computers operating system (OS) and other supporting programs, typically system software, to function. An application requests services from and communicates with other technologies via an application programming interface (API).',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
      ),

    );
  }
}
