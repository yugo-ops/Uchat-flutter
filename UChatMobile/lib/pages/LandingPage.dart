import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () => Navigator.pushNamed(context, '/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
            height: 100,
            child: Image.asset('assets/landing_image.jpg', fit: BoxFit.contain,),
          ),
        )
    );
  }
}
