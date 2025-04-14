import 'package:mvvmapp/data/network/base_api_service.dart';
import 'package:mvvmapp/data/network/network_api_service.dart';
import 'package:mvvmapp/model/movie_list_model.dart';
import 'package:mvvmapp/res/app_url.dart';

class HomeRepo {
  BaseApiService _apiService = NetworkApiService();

  Future<MovieModel> movies() async {
    try {
      dynamic response = await _apiService.getGetApiResponse(AppUrl.movieUrl);
      print("api hit");
      return response = MovieModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
