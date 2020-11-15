import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:team3/Common/InfoDialog.dart';
import 'package:team3/Common/data.dart';
import 'package:team3/Common/upperTransition.dart';
import 'package:team3/home/home.dart';
import 'package:team3/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String username = '';
  String password = '';

  @override
  void initState() {
    password = '';
    username = '';
    super.initState();
  }

  login() async {
    User formData = new User(userName: username, password: password);
    print(BaseUrl + 'login');
    User user = await formData
        .postData(BaseUrl + 'login', body: formData.toMap())
        .catchError(onError);
    if (user != null && user.userId != null) {
      //TODO Don't forget to clear it on logout
      //! SharedPreferences prefs = await SharedPreferences.getInstance();
      //! prefs.remove('authToken');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('authToken', user.authToken);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  user: user,
                )),
      );
    }
  }

  onError(e) {
    handleLoginError(context: context, message: e.source);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child:
      SingleChildScrollView(
        child:
        Stack(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height+60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/htw-bg1.jpg'), fit: BoxFit.cover),
                )),
            Container(
              height: MediaQuery.of(context).size.height+60,
              width: double.infinity,
              child: SafeArea(
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'HTW BERLIN',
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
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
                    Center(
                        child: Text(
                          'LOGIN',
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
                            padding: const EdgeInsets.only(left: 47, right: 50),
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
                                  hintText: 'Username/Email',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                  focusColor: Colors.white),
                              style:
                              TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 47, right: 50),
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
                                    fontSize: 18.0,
                                  ),
                                  focusColor: Colors.white),
                              style:
                              TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 50,
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
                                      login();
                                    }
                                  },
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Text(
                                    'Sign In',
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
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              print('forgot');
                            },
                            child: Container(
                              child: Text(
                                'Forgot password ?',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(createRoute('register'));
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
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(124, 186, 15, 0.58),
                        Color.fromRGBO(184, 189, 73, 0.56)
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}
