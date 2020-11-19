import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team3/Login/view.dart';
import 'package:team3/Widgets/Drawer.dart';
import 'package:team3/Widgets/FloatingButton.dart';
import 'package:team3/home/home.dart';
import 'models/user.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var authToken = prefs.getString('authToken');
  User user;
  if (authToken != null) {
    user = await User.getCurrentUser(authToken);
  }
  runApp(MaterialApp(
      title: 'App für betriebliche Kommunkation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      // if user token exist load direct the home page else load the login page
      home: authToken == null
          ? LoginPage()
          : MyApp(
              user: user,
            )));
}

class MyApp extends StatefulWidget {
  MyApp({Key key, this.user}) : super(key: key);

  final User user;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String result = "Hey there!"; //@TODO something consistent here

  Future _scanQR() async {
    try {
      String qrResult = (await BarcodeScanner.scan()) as String;
      setState(() {});
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SHS HTW App'),
          backgroundColor: Colors.lightGreen,
        ),
        body: HomePage(
          user: widget.user,
        ),
        drawer: drawer(context: context),
        floatingActionButton: floatingActionButton(scanQR: () => _scanQR()));
  }
}
