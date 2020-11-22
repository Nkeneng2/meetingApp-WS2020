import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team3/Calender/view.dart';
import 'package:team3/Common/upperTransition.dart';
import 'package:team3/Drawer%20Menu/Customize.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team3/Login/view.dart';

Drawer drawer({context,Function scanQR}) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[Colors.green, Colors.lightGreen])),
          child: Container(
            child: Column(
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Image.asset('assets/htwLogo.png',
                        width: 70, height: 70),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'SHS HTW',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                )
              ],
            ),
          ),
        ),
        CustomListTile(Icons.person, 'Profile', () => {}),
        CustomListTile(Icons.qr_code_scanner, 'QR Code Scanner', scanQR),
        CustomListTile(Icons.calendar_view_day, 'Calender',
            () => {Navigator.of(context).push(createRoute('calender'))}),
        CustomListTile(Icons.notifications, 'Notifications', () => {}),
        CustomListTile(Icons.settings, 'Settings', () => {}),
        CustomListTile(
            Icons.logout, 'Logout', () async => {logout(context: context)}),
      ],
    ),
  );
}

void logout({context}) async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('authToken');
  Navigator.of(context).push(createRoute('login'));
}
