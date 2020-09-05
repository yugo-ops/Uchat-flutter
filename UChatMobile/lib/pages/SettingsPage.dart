import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future<File> imageFile;

  //Open gallery
  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Settings"),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              child: Icon(Icons.add_a_photo, size: 80.0, color: Colors.white),
              onPressed: () {
                pickImageFromGallery(ImageSource.gallery);
              },
            ),
          ],
        ),
      )

    );
  }
}
