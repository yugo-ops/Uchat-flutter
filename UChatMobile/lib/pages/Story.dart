import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Row(
          children: <Widget>[
            Text("Story"),
            new FlatButton(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 50.0, 0.0),
              onPressed: (){},
              child: Icon(Icons.arrow_forward_ios,size: 20.0,),
            ),
          ],
        )
      ),
      body: Column(
        children: <Widget>[
          Center(child: Icon(Icons.trip_origin, size: 80.0, color: Colors.white,)),
        ],
      ),
       );
  }
}
