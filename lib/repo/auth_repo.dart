import 'package:mvvmapp/data/network/base_api_service.dart';
import 'package:mvvmapp/data/network/network_api_service.dart';
import 'package:mvvmapp/model/user_model.dart';
import 'package:mvvmapp/res/app_url.dart';

class AuthRepo {
  BaseApiService _apiService = NetworkApiService();
  Future<dynamic> login(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.loginUrl, data);
          print("api hit");
          return UserModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
   Future<dynamic> register(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.registerUrl, data);
          print("api hit");
          return UserModel.fromJson(response);

    } catch (e) {

      throw e;
    }
  }
}
