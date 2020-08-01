import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService{
  String baseUrl = "http://192.168.8.104:9000/user";

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
      print(jsonData);

    }
    catch(error){
      result = false;
      print("An error occurred at authenticate User $error");
    }

    return result;
  }

}