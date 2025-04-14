import 'package:flutter/material.dart';
import 'package:mvvmapp/utility/routes/route_names.dart';
import 'package:mvvmapp/view/home_view.dart';
import 'package:mvvmapp/view/login_view.dart';
import 'package:mvvmapp/view/signup_view.dart';
import 'package:mvvmapp/view/splash_view.dart';

class Routes {
  static MaterialPageRoute<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeView());
      case RouteNames.splash:
        return MaterialPageRoute(builder: (BuildContext context) => SplashView());
      case RouteNames.login :
        return MaterialPageRoute(builder: (BuildContext context) => LoginView());
      case RouteNames.signup :
        return MaterialPageRoute(builder: (BuildContext context) => SignupView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Container(
                    child: Text("No Route"),
                  ),
                ));
    }
  }
}
