class Response{
  // ignore: non_constant_identifier_names
  String ResponseCode;
  // ignore: non_constant_identifier_names
  String ResponseMessage;
  // ignore: non_constant_identifier_names
  Object ResponseObject;

  // ignore: non_constant_identifier_names
  Response({this.ResponseCode, this.ResponseMessage, this.ResponseObject});

  Response fromJson(Map data){
    if(data != null){
      Response result = new Response();
      result.ResponseCode = data["ResponseCode"];
      result.ResponseMessage = data["ResponseMessage"];
      result.ResponseObject = data["ResponseObject"];
      return result;
    }
    else{
      return null;
    }
  }

}