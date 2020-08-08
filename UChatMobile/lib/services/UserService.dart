import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:uchat_flutter_01/models/Response.dart';
import 'package:uchat_flutter_01/models/User.dart';

class UserService{
  String baseUrl = "http://192.168.8.101:9000/user";
  String errorMessage;

  UserService();
  // ignore: non_constant_identifier_names
  Future<bool> AuthenticateUser(String username, String password) async {
    bool result = false;
    try{
      //Write Methods here
      //First Set the headers
      Map<String, String> headers = {
        "Accept":"application/json",
        "Content-Type":"application/json"
      };

      final parameters = jsonEncode({
        'UserName':username,
        'Password': password
      });

      var response = await http.post(baseUrl + "/authenticateUser", headers: headers, body: parameters);
      Map jsonData = jsonDecode(response.body);
      Response resp = new Response().fromJson(jsonData);
      if(resp.ResponseCode == "00"){
        result = true;
      }
      else{
        result = false;
        errorMessage = resp.ResponseMessage;
      }
    }
    catch(error){
      result = false;
      print("An error occurred at authenticate User $error");
    }

    return result;
  }

  // ignore: non_constant_identifier_names
  Future<bool> Register(String LastName, String FirstName, String Username, String Password,String Pin, String PhoneNumber ) async {
    bool result = false;

    try{
        //Write Methods here
        //First Set the headers
        Map<String, String> headers = {
          "Accept":"application/json",
          "Content-Type":"application/json"
        };
        final parameters = jsonEncode({
         'FirstName':FirstName,
          'LastName':LastName,
          'UserName':Username,
          'Password':Password,
          'Pin':Pin,
          'PhoneNumber':PhoneNumber

        });
        var response = await http.post(baseUrl + "/register", headers: headers, body: parameters);
        Map jsonData = jsonDecode(response.body);
        Response resp = new Response().fromJson(jsonData);
        if(resp.ResponseCode == '00') {
          result = true;
        }
        else{
          result=false;
          errorMessage = resp.ResponseMessage;
        }
    }
    catch(error){
      result=false;
      print("An error occurred while Registering User $error");
    }


    return result;
  }

}