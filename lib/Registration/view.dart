import 'dart:ui';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:team3/Common/InfoDialog.dart';
import 'package:team3/Common/data.dart';
import 'package:team3/Common/upperTransition.dart';
import 'package:team3/EmailVerification/view.dart';
import 'package:team3/Widgets/BackgroundGradient.dart';
import 'package:team3/Widgets/BackgroundImage.dart';
import 'package:team3/Widgets/Header.dart';
import 'package:team3/models/user.dart';
import 'package:email_validator/email_validator.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  String username = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  @override
  void initState() {
    username = '';
    email = '';
    password = '';
    confirmPassword = '';
    super.initState();
  }

  register() async {
    User formData =
        new User(userName: username, password: password, email: email);
    User user = await formData
        .postData(BaseUrl + 'users', body: formData.toMap())
        .catchError(onError);
    if (user.userId != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EmailVerificationPage(
                  email: email,
                )),
      );
    }
  }

  /// method to be trigger on exception by login
  onError(e) {
    (Platform.isIOS)
        ? handleIosError(context: context, message: e.source)
        : handleAndroidError(context: context, message: e.source);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          backgroundImage(image: 'register-bg.jpg'),
          SingleChildScrollView(
            child: Container(
                height: (Platform.isIOS)
                    ? MediaQuery.of(context).size.height
                    : null,
                width: double.infinity,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header(),
                      Center(
                          child: Text(
                        'REGISTER',
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: TextFormField(
                                onChanged: (val) {
                                  setState(() => username = val);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintText: 'Username',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19.0,
                                    ),
                                    focusColor: Colors.white),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: TextFormField(
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (!EmailValidator.validate(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19.0,
                                    ),
                                    focusColor: Colors.white),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: TextFormField(
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19.0,
                                    ),
                                    focusColor: Colors.white),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: TextFormField(
                                onChanged: (val) {
                                  setState(() => confirmPassword = val);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please confirm your password';
                                  } else if (value != password) {
                                    return 'Your passwords don\'t match';
                                  }
                                  return null;
                                },
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintText: 'Password confirmation',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19.0,
                                    ),
                                    focusColor: Colors.white),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 47, right: 50),
                                child: ButtonTheme(
                                  minWidth: MediaQuery.of(context).size.width,
                                  height: 55,
                                  child: RaisedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        register();
                                      }
                                    },
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 25),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(createRoute('login'));
                                },
                                child: Container(
                                  child: Text(
                                    'Already have an anccount ? Sign Up',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                decoration: backgroundGradient()),
          ),
        ],
      ),
    );
  }
}
