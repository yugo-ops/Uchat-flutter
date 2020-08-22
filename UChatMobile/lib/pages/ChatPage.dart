import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uchat_flutter_01/pages/SettingsPage.dart';
import 'package:uchat_flutter_01/pages/Story.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          children: <Widget>[
            new Text("Chats"),
            new FlatButton(
              onPressed: ()async{
                await Navigator.push(context, MaterialPageRoute(
                    builder: (context) => StoryPage()
                ));
                },
              child: Icon(Icons.arrow_forward_ios, size: 20.0,),
            ),
            new FlatButton(
              padding: EdgeInsets.fromLTRB(120.0, 0.0, 0.0, 0.0),
              onPressed: (){},
              child: Icon(Icons.search),
            ),
            new FlatButton(
              padding: EdgeInsets.fromLTRB(50.0, 0.0, 0.0, 0.0),
              onPressed: () async {
                await Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SettingsPage()
                ));
              },
              child: Icon(Icons.more_vert,),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: 200,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              leading: Icon(Icons.perm_identity, color: Colors.blue,),
              title: Text("Name", style: TextStyle(color: Colors.white),),
            );
          }
      )
    );
  }
}
