import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget header() {
  return
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'SHS HTW BERLIN',
            style: TextStyle(
                fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
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
      ],
    );
}
