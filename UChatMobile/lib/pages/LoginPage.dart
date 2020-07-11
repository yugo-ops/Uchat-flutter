
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                child: Image.asset('assets/landing_image.jpg', fit: BoxFit.contain,),
              ),
            ),
            SizedBox(height: 40.0,),
            Container(
              color: Colors.blue,
              
              child: TextField(
                style: TextStyle(color: Colors.white, fontSize: 20.0),
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  hintText: 'Username',
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
