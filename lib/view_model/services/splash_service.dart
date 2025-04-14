import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvmapp/model/user_model.dart';
import 'package:mvvmapp/utility/routes/route_names.dart';
import 'package:mvvmapp/view_model/user_view_model.dart';

class SplashService {
  Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuth(BuildContext context) async {
    getUserData().then((val) async {
      print("token value: ${val.token}");
      if (val.token == "null" || val.token == "") {
        await Future.delayed(Duration(seconds: 3));

        Navigator.pushNamed(context, RouteNames.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RouteNames.home);
      }
    }).onError((Error, StackTrace) {
      if (kDebugMode) {
        print("object");
      }
    });
  }
}
