import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Settings"),
      ),
      body: Column(
        children: <Widget>[
          Center(child: Icon(Icons.add_a_photo, size: 80.0, color: Colors.white,)),

        ],
      )
    );
  }
}
