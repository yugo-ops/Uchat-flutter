import 'package:flutter/material.dart';
import 'package:uchat_flutter_01/pages/LandingPage.dart';
import 'package:uchat_flutter_01/pages/LoginPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/landingpage",
    routes: {
      "/landingpage" : (context) => LandingPage(),
      "/login" : (context) => LoginPage(),
    },
  ));
}