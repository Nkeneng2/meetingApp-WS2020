import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team3/Login/view.dart';

class EmailVerificationPage extends StatefulWidget {
  EmailVerificationPage({Key key, this.email}) : super(key: key);
  final String email;

  @override
  _EmailVerificationPageState createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify your email'),
      ),
      body: Container(
        child: Stack(children: [
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/htw-bg1.jpg'), fit: BoxFit.cover),
              )),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Text(
                      'An email has been sent to ' + widget.email,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width,
                      height: 55,
                      child: RaisedButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          'Log in',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
        ]),
      ),
    );
  }
}
