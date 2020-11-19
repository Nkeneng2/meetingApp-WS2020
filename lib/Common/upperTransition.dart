import 'package:flutter/cupertino.dart';
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
