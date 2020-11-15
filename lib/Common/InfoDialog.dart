
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void handleLoginError({context,message}) {
  var scrollController = ScrollController();
  var actionScrollController = ScrollController();
  var dia = CupertinoAlertDialog(
    title: Text("Oups"),
    content: Text(message),
    actions: <Widget>[
      CupertinoDialogAction(
        child: Text("Ok"),
        onPressed: () {
          Navigator.of(context).pop();
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
