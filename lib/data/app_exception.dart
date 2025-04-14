

class AppException implements Exception{
  final _message;
  final _prefix;
  AppException([this._message,this._prefix]);

  String toString(){
    return "$_message$_prefix";
  }
}

class FetechDataException extends AppException{
  FetechDataException([String? message]) :super(message,"Error during communication");


}


class BadReqException extends AppException{
  BadReqException([String? message]) :super(message,"Invalid request");


}

class UnAuthorizeException extends AppException{
  UnAuthorizeException([String? message]) :super(message,"Unauthorized request");


}


class InvalidInputException extends AppException{
  InvalidInputException([String? message]) :super(message,"invalid input");


}