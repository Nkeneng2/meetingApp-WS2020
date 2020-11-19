import 'package:flutter/material.dart';

FloatingActionButton floatingActionButton({Function scanQR}) {
  return FloatingActionButton.extended(
    icon: Icon(Icons.camera_alt),
    label: Text('Scan'),
    onPressed: scanQR,
  );
}
