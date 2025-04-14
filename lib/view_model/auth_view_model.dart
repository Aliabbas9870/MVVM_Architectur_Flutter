import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvmapp/repo/auth_repo.dart';
import 'package:mvvmapp/utility/routes/route_names.dart';
import 'package:mvvmapp/utility/utils.dart';
import 'package:mvvmapp/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myrepo = AuthRepo();
  static bool _loading = false;
  static bool get loading => _loading;
// for sign up
    static bool _signupLoading = false;
  static bool get signupLoading => _signupLoading;
  setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }
  setSignupLoading(bool val) {
    _signupLoading = val;
    notifyListeners();
  }
  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myrepo.login(data).then((val) {
      setLoading(false);
         final userPref=Provider.of<UserViewModel>(context,listen: false);
    userPref.saveUser(val);
            Navigator.pushNamed(context, RouteNames.home);
      if (kDebugMode) {
        Utils.toastMessage("Cograts");
      }
      Navigator.pushNamed(context, RouteNames.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
        Utils.ShowErrorMessage(error.toString(), context);
      }
    });
  }
// signup regisster
  Future<void> registerApi(dynamic data, BuildContext context) async {
    setSignupLoading(true);
    _myrepo.register(data).then((val) {
     setSignupLoading(false);
            Navigator.pushNamed(context, RouteNames.home);
      if (kDebugMode) {
        Utils.toastMessage("Cograts");
      }
      Navigator.pushNamed(context, RouteNames.home);
    }).onError((error, stackTrace) {
      setSignupLoading(false);

      if (kDebugMode) {
        Utils.ShowErrorMessage(error.toString(), context);
      }
    });
  }
}
