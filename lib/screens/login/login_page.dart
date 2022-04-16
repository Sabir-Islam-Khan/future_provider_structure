import 'package:flutter/material.dart';

import '../../services/auth_api_service.dart';
import '../../utils/themes.dart';
import '../../utils/mixins/validation_mixin.dart';
import '../splash_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

/* extends State with ValidationMixin allow us to reference the functions
and use them as though they are defined within this class. */
class _LoginPageState extends State<LoginPage> with ValidationMixin {
  final loginFormKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool isLoading = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    ScreenSize.height = MediaQuery.of(context).size.height;
    ScreenSize.width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: isLoading == true
            ? splashScreen()
            : Container(
          margin: const EdgeInsets.all(20.0),
          child: Form(
            key: loginFormKey, // Passing in GlobalKey
            child: Column(
              children: [
                Container(margin: const EdgeInsets.only(top: 120.0)),
                emailField(),
                Container(margin: const EdgeInsets.only(top: 30.0)),
                passwordField(),
                Container(margin: const EdgeInsets.only(top: 5.0)),
                forgotPasswordButton(),
                Container(margin: const EdgeInsets.only(top: 40.0)),
                submitButton(),
              ],
            ),
          ),
        )
    );
  }

  //////////////////////////// Email Field Widget ////////////////////////////
  Widget emailField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(color: Colors.black54, fontSize: 22),
        decoration: const InputDecoration(
          labelText: 'Enter Email Address',
          hintText: 'you@example.com',
        ),
        /* No bracket runs validateEmail without calling emailField widget */
        validator: validateEmail,
        onSaved: (String? value) {
          email = value!.trim().toString(); // Posting email value
          debugPrint(value);
        }
    );
  }
  /////////////////////////// Password Field Widget ///////////////////////////
  Widget passwordField() {
    return TextFormField(
        obscureText: _obscureText,
        obscuringCharacter: "*",
        style: const TextStyle(color: Colors.black54, fontSize: 22),
        decoration: InputDecoration(
          labelText: 'Enter Password',
          hintText: 'Password',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Icon(
              _obscureText
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
          ),
        ),
        validator: validatePassword,
        onSaved: (String? value) {
          password = value!.trim().toString(); // Posting password value
          debugPrint(value);
        }
    );
  }
  /////////////////////////// Forgot Password Widget ///////////////////////////
  Widget forgotPasswordButton() {
    return TextButton(
      style: TextButton.styleFrom(primary: Colors.transparent),
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 20,
        ),
      ),
      onPressed: () {
        AuthApiService().launchForgetPassword();
        //AuthProvider().launchForgetPassword();
      }, //Missing press function (Forgot)
    );
  }

  //////////////////////////// Submit Button Widget ////////////////////////////
  Widget submitButton() {
    return ElevatedButton(
      child: const Text('Submit'),
      style: ElevatedButton.styleFrom(
        primary: Colors.lightBlueAccent[700],  // background color
        onPrimary: Colors.white, // text color
        side: BorderSide(width:3.0, color: Colors.green.shade800), // border
        textStyle: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.all(15.0),
      ),
      // onPressed is a callback
      onPressed: () {
        // if validate == True, save data
        if(loginFormKey.currentState!.validate()) {
          loginFormKey.currentState?.save();
          AuthApiService().login(context, email, password);
          debugPrint('Posted $email and $password successfully to API from onPressed');
        }
      },
    );
  }
}