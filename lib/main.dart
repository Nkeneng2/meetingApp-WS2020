import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team3/home/home.dart';
import 'Login/view.dart';
import 'models/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //TODO only for test purposes to continue working on login screen
  // prefs.remove('authToken');
  var authToken = prefs.getString('authToken');
  User user;
  if (authToken != null) {
    user = await User.getCurrentUser(authToken);
  }
  runApp(MaterialApp(
      home: authToken == null
          ? MyApp()
          : HomePage(
              user: user,
            )));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App für betriebliche Kommunkation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: LoginPage(title: 'App für betriebliche Kommunkation'),
    );
  }
}
