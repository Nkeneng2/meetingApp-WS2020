//  Copyright (c) 2019 Aleksander Woźniak
//  Licensed under Apache License v2.0
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'Calender/view.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
