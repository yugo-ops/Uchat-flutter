class UserService{

  Future<bool> AuthenticateUser(String username, String password) async {
    bool result = false;
    try{
      //Write Methods here

    }
    catch(error){
      result = false;
      print("An error occurred at authenticate User $error");
    }

    return result;
  }

}