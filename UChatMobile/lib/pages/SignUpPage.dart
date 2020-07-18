import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100.0,),
            Center(
              child: SizedBox(
                height: 100,
                child: Image.asset('assets/landing_image.jpg', fit: BoxFit.contain,),
              ),
            ),
            SizedBox(height: 40.0,),
            TextField(
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                hintText: 'FirstName',
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              ),
            ),
            SizedBox(height: 20.0,),
            TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                hintText: 'LastName',
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              ),
            ),
            SizedBox(height: 20.0,),
            TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                hintText: 'Password',
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              ),
            ),

            SizedBox(height: 20.0,),
            TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                hintText: 'Re-Type Password',
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              ),
            ),

            SizedBox(height: 20.0,),
            TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              keyboardType: TextInputType.number,
              maxLength: 4 ,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                hintText: 'Pin',
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              ),
            ),
            RaisedButton(
              elevation: 2.0,
              color: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () {},
              child: Text("SignIn", style: TextStyle(fontSize: 20.0),),
            )
          ],
        ),
      ),
    );
  }
}
