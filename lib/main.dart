import 'package:flutter/material.dart';
import 'package:mvvmapp/utility/routes/route.dart';
import 'package:mvvmapp/utility/routes/route_names.dart';
import 'package:mvvmapp/view_model/auth_view_model.dart';
import 'package:mvvmapp/view_model/home_view_model.dart';
import 'package:mvvmapp/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter MVVM',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RouteNames.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}





