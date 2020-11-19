import 'dart:ui';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:team3/Common/InfoDialog.dart';
import 'package:team3/Common/data.dart';
import 'package:team3/Common/upperTransition.dart';
import 'package:team3/Widgets/BackgroundGradient.dart';
import 'package:team3/Widgets/BackgroundImage.dart';
import 'package:team3/Widgets/Header.dart';
import 'package:team3/main.dart';
import 'package:team3/models/user.dart';

class ResetPage extends StatefulWidget {
  ResetPage({Key key}) : super(key: key);

  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final _formKey = GlobalKey<FormState>();

  // form username field value
  String email = '';

  @override

  /// state init
  void initState() {
    email = '';
    super.initState();
  }

  /// method to log the user in
  reset() async {
    User formData = new User(email: email);
    print(BaseUrl + 'requestPasswordReset');
    User user = await formData
        .postData(BaseUrl + 'reset', body: formData.toMap())
        .catchError(onError);
    // if the response could be transform in user and contains a real userId
    if (user != null && user.userId != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyApp(
                  user: user,
                )),
      );
    }
  }

  /// method to be trigger on exception by reset
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
          backgroundImage(image: 'reset-bg.jpg'),
          SingleChildScrollView(
            child: Container(
              height:
                  (Platform.isIOS) ? MediaQuery.of(context).size.height : null,
              width: double.infinity,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(),
                    Center(
                        child: Text(
                      'Reset password',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              'Please enter your email and you will receive a reset link',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 47, right: 50),
                            child: TextFormField(
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your email';
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
                                      reset();
                                    }
                                  },
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Text(
                                    'Reset',
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
              decoration: backgroundGradient(),
            ),
          ),
        ],
      ),
    );
  }
}
