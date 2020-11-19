import 'package:flutter/cupertino.dart';

BoxDecoration backgroundGradient() {
  return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        Color.fromRGBO(124, 186, 15, 0.58),
        Color.fromRGBO(184, 189, 73, 0.56)
      ]));
}
