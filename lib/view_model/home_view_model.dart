import 'package:flutter/foundation.dart';
import 'package:mvvmapp/data/response/api_response.dart';
import 'package:mvvmapp/model/movie_list_model.dart';
import 'package:mvvmapp/repo/home_repo.dart';

class HomeViewModel with ChangeNotifier {
  final _myrepo = HomeRepo();
  ApiResponse<MovieModel> movieList = ApiResponse.loading();

  setMovie(ApiResponse<MovieModel> response) {
    movieList = response;
    notifyListeners();
  }

  Future<void> fetechMovieLsit() async {
    setMovie(ApiResponse.loading());

    _myrepo.movies().then((val) {
      setMovie(ApiResponse.completed(val));
    }).onError((error, StackTrace) {
      setMovie(ApiResponse.error(error.toString()));

      if (kDebugMode) {}
    });
  }
}
