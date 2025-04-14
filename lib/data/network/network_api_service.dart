import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvmapp/data/app_exception.dart';
import 'package:mvvmapp/data/network/base_api_service.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responsejson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responsejson = returnResponse(response);
    } on SocketException {
      throw FetechDataException("No Internet ");
    }
    return responsejson;
  }




// fr  post 
  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responsejson;
    try {
      Response response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      responsejson = returnResponse(response);
    } on SocketException {
      throw FetechDataException("No Internet ");
    }

     return responsejson;
  }




  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadReqException(response.body.toString());
      case 404:
        throw UnAuthorizeException(response.body.toString());
      default:
        throw FetechDataException("Error ocure while communicating" +
            " status code " +
            response.statusCode.toString());
    }
  }
}
