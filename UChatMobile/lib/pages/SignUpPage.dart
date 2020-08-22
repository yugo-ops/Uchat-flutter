import 'package:flutter/material.dart';
import 'package:uchat_flutter_01/services/UserService.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final retypePasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final pinController = TextEditingController();

  @override
  void initState() {
    super.initState();

   // testGuy();
  }

  // ignore: non_constant_identifier_names
  Future<void> AuthenticateUser() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    String retypedPassword = retypePasswordController.text.trim();
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phoneNumber = phoneNumberController.text.trim();
    String pin = pinController.text.trim();

    if(username.isEmpty || password.isEmpty||firstName.isEmpty||lastName.isEmpty||phoneNumber.isEmpty||pin.isEmpty || retypedPassword.isEmpty){
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: new Text('Invalid'),
              content: new Text("Please fill all fields"),
              actions: <Widget>[
                new FlatButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: new Text("Retry!"))
              ],
            );
          }
      );
    }
    else if(password != retypedPassword){
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: new Text('Invalid'),
              content: new Text("Passwords do not match"),
              actions: <Widget>[
                new FlatButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: new Text("Retry!"))
              ],
            );
          }
      );
    }
    else{
      UserService userService = new UserService();
      bool result = await userService.Register(username, password, firstName, lastName, phoneNumber, pin);
      if(result){
        //Log the user into the application
        await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: new Text('Success'),
                content: new Text("Registration Successful"),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: new Text("OK!"))
                ],
              );
            }
        );
      }
      else{
        //Display error message
        await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: new Text('Failed'),
                content: new Text("Registration Failed! " + userService.errorMessage),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: new Text("Retry!"))
                ],
              );
            }
        );
      }
    }
  }

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
              controller: firstNameController,
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
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              controller: lastNameController,
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
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              controller: usernameController,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                hintText: 'UserName',
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              ),
            ),
            SizedBox(height: 20.0,),
            TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              controller: passwordController,
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
              controller: retypePasswordController,
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
            SizedBox(height: 20.5,),
            TextField(
              obscureText: false,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              controller: phoneNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                hintText: 'Phone Number',
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              ),
            ),
            SizedBox(height: 20.0,),
            TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              controller: pinController,
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
              onPressed: () {
                AuthenticateUser();
              },
              child: Text("SignIn", style: TextStyle(fontSize: 20.0),),
            ),
          ],
        ),
      ),
    );
  }
}
