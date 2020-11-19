import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void handleAndroidError({BuildContext context, message}) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Oups'),
      content: Text(message),
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    ),
  );
}

void handleIosError({BuildContext context, message}) async {
  var scrollController = ScrollController();
  var actionScrollController = ScrollController();
  var dia = CupertinoAlertDialog(
    title: Text("Oups"),
    content: Text(message),
    actions: <Widget>[
      CupertinoDialogAction(
        child: Text("Ok"),
        onPressed: () {
          // Navigator.of(context).pop();
          Navigator.of(context, rootNavigator: true).pop();
        },
        isDefaultAction: true,
        isDestructiveAction: false,
      ),
    ],
    scrollController: scrollController,
    actionScrollController: actionScrollController,
  );

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return dia;
      });
}
