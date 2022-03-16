import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lostandfound/registration.dart';
import 'package:lostandfound/splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);
  static const String route="/login";

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  signIn() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if(authCredential.uid.isNotEmpty){
        Navigator.push(context, CupertinoPageRoute(builder: (_)=>splashscreen()));
      }
      else{
        Fluttertoast.showToast(msg:'Please Login With correct Page ');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg:'No user found for that email.');

      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg:'Wrong password provided for that user.');

      }
    } catch (e) {
      print(e);
    }
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
                  Color(0xFF99ff99),
                  Color(0xFFccb3ff),
                  Color(0xFF99ebff),
                ] )
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 130,
                //width: ScreenUtil().screenWidth,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.light,
                          color: Colors.transparent,
                        ),
                      ),
                      Text("Sign In",
                        style:GoogleFonts.staatliches (fontSize: 40, color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text("Welcome to LogIn Page.", style: TextStyle(
                                fontSize: 30, color: Colors.deepOrange,fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Please write to correct information.", style:TextStyle(
                              fontSize: 16,
                              color: Color(0xFFBBBBBB),fontWeight: FontWeight.bold
                            ),),
                          SizedBox(height: 65,),
                          Row(
                            children: [
                              Container(
                                height: 48,
                                width: 41,
                                decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                  child: Icon(
                                    Icons.email_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    hintText: "Enter Your Email",
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF414041),
                                    ),
                                    labelText: 'EMAIL',
                                    labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 48,
                                width: 41,
                                decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                  child: Icon(
                                    Icons.lock_outline,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _passwordController,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    hintText: "password must be 6 character",
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF414041),
                                    ),
                                    labelText: 'PASSWORD',
                                    labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.deepOrange,
                                    ),
                                    suffixIcon: _obscureText == true
                                        ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = false;
                                          });
                                        },
                                        icon: Icon(Icons.remove_red_eye,
                                          size: 20,
                                        ))
                                        : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = true;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.visibility_off,
                                          size: 20,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 65,),
                          Center(
                            child: SizedBox(
                              width: 190,height: 56,
                              child: ElevatedButton(
                                onPressed: (){
                                  signIn();
                                },
                                child: Text('Sign In',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                              ),
                            ),
                          ),

                          SizedBox(
                            height: 50,
                          ),

                          //================  have to active later   ===================
                          // elevated button
                          // customButton(
                          //   "Sign In",
                          //   () {
                          //     signIn();
                          //   },
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          Wrap(
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFBBBBBB),
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  " Sign Up",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context,"/registration");
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
