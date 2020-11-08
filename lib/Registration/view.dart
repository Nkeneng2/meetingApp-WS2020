import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:team3/Login/view.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


class _RegistrationPageState extends State<RegistrationPage> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/htw-bg1.jpg'), fit: BoxFit.cover),
                )),
            Container(
              height: double.infinity,
              width: double.infinity,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'HTW BERLIN',
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'betriebliche Kommunikation und Terminvereinbarung',
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Center(
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 47,right: 50),
                      child: TextField(
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white
                                )
                            ),
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            focusColor: Colors.white
                        ),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 47,right: 50),
                      child: TextField(
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white
                                )
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            focusColor: Colors.white
                        ),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 47,right: 50),
                      child: TextField(
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white
                                )
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            focusColor: Colors.white
                        ),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 47,right: 50),
                      child: TextField(
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white
                                )
                            ),
                            hintText: 'Confirm password',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            focusColor: Colors.white
                        ),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child:
                      Padding(
                        padding: const EdgeInsets.only(left: 47,right: 50),
                        child: ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 55,
                          child: RaisedButton(
                            onPressed: (){},color: Colors.white,shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                          ),child: Text('Sign Up',style: TextStyle(color: Colors.black,fontSize: 25),),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(_createRoute());
                              },
                              child: Container(
                                child: Text('Already have an anccount ? Sign Up',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(124, 186, 15, 0.58),
                        Color.fromRGBO(184, 189, 73, 0.56)
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}
