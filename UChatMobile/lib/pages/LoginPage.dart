import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uchat_flutter_01/pages/SignUpPage.dart';
import 'package:uchat_flutter_01/services/UserService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();

    testGuy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 100.0),
              Center(
                child: SizedBox(
                  height: 100,
                  child: Image.asset(
                    'assets/landing_image.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              TextField(
                style: TextStyle(color: Colors.white, fontSize: 20.0),
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  hintText: 'Username',
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  hintText: 'Password',
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      //push to forgot password page
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Forgot Password"),
                              content: TextField(
                                obscureText: true,
                                keyboardType: TextInputType.number,
                                maxLength: 4,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    labelText: "Input Back-up Pin",
                                    labelStyle: TextStyle(color: Colors.blue)),
                              ),
                              actions: <Widget>[
                                Row(
                                  children: <Widget>[
                                    new FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                    SizedBox(
                                      width: 120.0,
                                    ),
                                    new FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Ok")),
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.blue),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                  ),
                  GestureDetector(
                    onTap: () async {
                      //push to sign up page
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              RaisedButton(
                elevation: 2.0,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
                child: Text(
                  "LogIn",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ));
  }

  void testGuy() async {
    await UserService().AuthenticateUser("Admin", "password");
  }
}
