import 'package:flutter/material.dart';
import 'package:mvvmapp/res/components/round_button.dart';
import 'package:mvvmapp/utility/routes/route_names.dart';
import 'package:mvvmapp/utility/utils.dart';
import 'package:mvvmapp/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  ValueNotifier<bool> obscurePass=ValueNotifier<bool>(true);
  

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
    emailFocus.dispose();
    passFocus.dispose();
  }

  FocusNode emailFocus=FocusNode();
  FocusNode passFocus=FocusNode();
  @override
  Widget build(BuildContext context) {
    final authViewModel= Provider.of<AuthViewModel>(context);
    print("build");
    return Scaffold(
          appBar: AppBar(
            title: Text("Login"),
            centerTitle: true,
          ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: emailController,
              focusNode: emailFocus,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.alternate_email),
                hintText: "Email", labelText: "Email"),
                onSubmitted: (val){
                  Utils.focusChange(context, emailFocus, passFocus);
                },
            ),
ValueListenableBuilder(valueListenable: obscurePass, builder: (context,val,child){
  return     TextField(
              controller: passController,
              obscuringCharacter: "*",
              focusNode: passFocus,
              obscureText:obscurePass.value,
              decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_open_outlined),
                suffixIcon: IconButton(onPressed: (){
                  obscurePass.value=!obscurePass.value;
                }, icon: 
                
                obscurePass.value==true?
                Icon(Icons.visibility_off):Icon(Icons.visibility_rounded)),
                
                hintText: "Password", labelText: "password"),
                onSubmitted: (val){
                  // Utils.focusChange(context, emailFocus, passFocus);
                },
            );
}),
RoundButton(title: "Login",

loading: AuthViewModel.loading,
 onPresses: (){

  if(emailController.text.isEmpty){
    Utils.ShowErrorMessage("Please Enter the Email Address", context);

  }
   else if(passController.text.isEmpty&&passController.text.length<6){
    Utils.ShowErrorMessage("Please Enter the passowrd at least 6 digit!", context);

  }
  else{

    Map data={
      "email":emailController.text.toString(),
      "password":passController.text.toString(),

    };
    authViewModel.loginApi(data,context);
    // Utils.toastMessage("Congrats!");
  }
}),

           TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.signup
                  );
                  Utils.toastMessage("Hello ali  i am moved");
                },
                child: Text("Don't have a account Login")),
          ],
        ),
      ),
    );
  }
}
