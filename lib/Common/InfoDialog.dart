import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void handleLoginError({context, message}) async {
  var scrollController = ScrollController();
  var actionScrollController = ScrollController();

  if (!Platform.isIOS) {
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
  var dia = CupertinoAlertDialog(
    title: Text("Oups"),
    content: Text(message),
    actions: <Widget>[
      CupertinoDialogAction(
        child: Text("Ok"),
        onPressed: () {
            Navigator.of(context).pop(true);
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
