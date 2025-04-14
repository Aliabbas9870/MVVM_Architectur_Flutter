import 'package:flutter/material.dart';
import 'package:mvvmapp/view_model/services/splash_service.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashService splash = SplashService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash.checkAuth(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
              child: Text(
        "Splash View MVVM",
        style: TextStyle(
            fontSize: 21,
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold),
      ))),
    );
  }
}
