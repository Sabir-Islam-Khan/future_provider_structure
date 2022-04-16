import 'package:flutter/material.dart';

import '../../utils/themes.dart';
import '../../utils/mixins/validation_mixin.dart';
import '../../services/auth_api_service.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

// extends State with ValidationMixin allow us to reference the functions
// and use them as though they are defined within this class.
class _RegistrationPageState extends State<RegistrationPage> with ValidationMixin {
  final registrationFormKey = GlobalKey<FormState>(); // GlobalKey
  String email = '';
  String password = '';

  @override
  Widget build(context) {
    ScreenSize.height = MediaQuery.of(context).size.height;
    ScreenSize.width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: ScreenSize.width,
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: Form(
                key: registrationFormKey, // Passing in GlobalKey
                child: Column(
                  children: [
                    Container(margin: const EdgeInsets.only(top: 120.0)),
                    headerBox(),
                    Container(margin: const EdgeInsets.only(top: 40.0)),
                    emailField(),
                    Container(margin: const EdgeInsets.only(top: 30.0)),
                    passwordField(),
                    Container(
                      margin: const EdgeInsets.only(top: 40.0),
                      //height: ScreenSize.height * 0.1,
                    ),
                    submitButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  //////////////////////////// Header Box Widget ////////////////////////////
  Widget headerBox() {
    return const Text(
        'Registration'
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
      // no bracket runs validateEmail without calling emailField widget
      validator: validateEmail,
      onSaved: (String? value) {
        email = value!; // Posting email value
        debugPrint(value);
      },
    );
  }
  /////////////////////////// Password Field Widget ///////////////////////////
  Widget passwordField() {
    return TextFormField(
        obscureText: true,
        obscuringCharacter: "*",
        style: const TextStyle(color: Colors.black54, fontSize: 22),
        decoration: const InputDecoration(
          labelText: 'Enter Password',
          hintText: 'Password',
        ),
        // no bracket runs validatePassword without calling emailField widget
        validator: validatePassword,
        onSaved: (String? value) {
          password = value!; // Posting password value
          debugPrint(value);
        }
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
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.all(15.0),
      ),
      // onPressed is a callback
      onPressed: () {
        // if validate == True, save data
        if(registrationFormKey.currentState!.validate()) {
          registrationFormKey.currentState?.save();
          AuthApiService().login(context, email, password);
          debugPrint('Posted $email and $password successfully to API from onPressed');
        }
      },
    );
  }
}