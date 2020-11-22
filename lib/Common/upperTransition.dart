import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team3/Calender/view.dart';
import 'package:team3/Login/view.dart';
import 'package:team3/Registration/view.dart';
import 'package:team3/Login/view.dart';
import 'package:team3/Registration/view.dart';
import 'package:team3/Reset/view.dart';



Route createRoute(route) {
  var callback;
  switch (route) {
    case 'register':
      {
        callback = RegistrationPage();
        break;
      }
    case 'login':
      {
        callback = LoginPage();
        break;
      }
    case 'reset':
      {
        callback = ResetPage();
        break;
      }
    case 'calender':
      {
        callback = MyHomePage(title: 'Calender Page',);
        break;
      }
  }
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => callback,
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

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHS',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Table Calendar'),
      color: Colors.green.shade400,
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
