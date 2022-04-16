import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_api_service.dart';
import '../utils/environment_variables.dart';
import '../utils/api_endpoints.dart';
import '../utils/dialogs.dart';
import '../screens/login/login_page.dart';
import '../screens/home/home_page.dart';
import '../screens/landing/landing_page.dart';

class AuthApiService {
  //////////////////////////////// User Login ////////////////////////////////
  Future<void> login(
      BuildContext context, String email, String password) async {
    debugPrint("Posted $email and $password successfully to API \n\n");
    String credentials = email + ":" + password;
    String encodedCred = base64Url.encode(utf8.encode(credentials));
    String b64BAHeader = "Basic " + encodedCred;

    var response = await http.post(Uri.parse(ApiUrl.loginURL),
        headers: <String, String>{
          'Authorization': b64BAHeader,
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "email": email,
          "password": password,
        }));

    debugPrint("AuthAPIProvider responseStatus: ${response.statusCode} \n\n");
    debugPrint("AuthAPIProvider responseHeader: ${response.headers} \n\n");

    if (response.statusCode == 200) {
      final parsedJson = jsonDecode(response.body);
      userId = parsedJson['id'];
      token = parsedJson['token'];

      debugPrint("AuthAPIProvider parsedJson: $parsedJson \n\n");
      debugPrint(
          "AuthAPIProvider parsedJsonEmail: ${parsedJson['email']} \n\n");

      debugPrint("AuthAPIProvider parsedJsonId: ${parsedJson['id']} \n\n");
      debugPrint("AuthAPIProvider userToken: ${parsedJson['token']} \n\n");

      //SAVING ENCRYPTED LOGIN CREDENTIAL FOR AUTOLOGIN
      // autoLoginEncKey is defined in /utils/global_variables.dart.
      final key = encrypt.Key.fromUtf8(autoLoginEncKey);
      final iv = encrypt.IV.fromLength(16);
      final encrypter = encrypt.Encrypter(encrypt.AES(key));
      final encryptedEmail = encrypter.encrypt(email, iv: iv);
      final encryptedPassword = encrypter.encrypt(password, iv: iv);

      SharedPreferences.getInstance().then(
        (prefs) {
          prefs.setBool("isLoggedIn", true);
          prefs.setString("userId", userId.toString());
          prefs.setString("token", token);
          prefs.setString("email", encryptedEmail.base64);
          prefs.setString("password", encryptedPassword.base64);

          debugPrint(
              "UserAPIProvider sharedPrefUserID: ${prefs.getString("userId")} \n\n");
          debugPrint(
              "UserAPIProvider sharedPrefToken: ${prefs.getString("token")} \n\n");
        },
      );
      // Get current user location
      UserApiService().fetchCurrentLocation();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (Route<dynamic> route) => false);
    } else if (response.statusCode == 401) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LandingPage(),
        ),
      );
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  /////////////////////////// isUserLoggedIn ///////////////////////////
  late bool isLoggedInResult;
  Future<bool?> isUserLoggedIn() async {
    SharedPreferences.getInstance().then((prefs) {
      isLoggedInResult = prefs.getBool("isLoggedIn")!;
      debugPrint('AuthApiService().isLoggedIn(): $isLoggedInResult \n\n');
      return isLoggedInResult;
    });
    return false;
  }

  /////////////////////////////// User Auto-Login ///////////////////////////////
  Future<void> userAutoLogin(BuildContext context) async {
    SharedPreferences.getInstance().then(
      (prefs) {
        if (prefs.getBool("isLoggedIn") == true) {
          debugPrint("Returning user auto-login on ${DateTime.now()} \n \n");
          // Retrieve credentials from SharedPreferences
          final encryptedEmail = prefs.getString("email");
          final encryptedPassword = prefs.getString("password");
          // Decode encrypted credentials
          final key = encrypt.Key.fromUtf8(autoLoginEncKey);
          final iv = encrypt.IV.fromLength(16);
          final encrypter = encrypt.Encrypter(encrypt.AES(key));
          if (encryptedEmail != null) {
            final email = encrypter.decrypt64(encryptedEmail, iv: iv);
            final password = encrypter.decrypt64(encryptedPassword!, iv: iv);
            // login method declared in repos/authentication.dart
            login(context, email, password);
          }
        }
      },
    );
  }

  /////////////////////////// User Logout ///////////////////////////
  Future<void> userLogout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    prefs.setBool("isLoggedIn", false);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (Route<dynamic> route) => false);
    debugPrint("Set isLoggedIn false");
  }

  /////////////////////////// Register User ///////////////////////////
  Future<void> registerUser(
      BuildContext context, String email, String password) async {
    final Map<String, dynamic> registrationData = {
      "email": email,
      "password": password
    };
    String jsonData = jsonEncode(registrationData);
    var response = await http.post(
      Uri.parse(ApiUrl.registrationURL),
      body: jsonData,
    );
    if (response.statusCode == 200) {
      var parsedJson = jsonDecode(response.body);
      if (parsedJson['email'] == 'email already exist') {
        await registrationEmailExistDialog(context);
      }
    } else if (response.statusCode == 201) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LandingPage(),
        ),
      );
    }
  }

  /////////////////////////// Forgot Password ///////////////////////////
  Future<void> launchForgetPassword() async {
    if (!await launch(ApiUrl.forgotPasswordURL))
      throw 'Could not launch ${ApiUrl.forgotPasswordURL}';
  }
}
