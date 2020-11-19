import 'package:flutter/cupertino.dart';

Widget backgroundImage({image}) {
  return Container(
      decoration: BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/' + image), fit: BoxFit.cover),
  ));
}
