import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../utils/environment_variables.dart';
import '../utils/api_endpoints.dart';
import '../screens/home/home_page.dart';

class UserApiService {
  ////////////////////////////// GET fetchUser //////////////////////////////
  Future<User> fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _userId = prefs.getString("userId");

    final userURL = Uri.parse(ApiUrl.userLink + _userId.toString());
    final response = await http.get(
      userURL,
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
    );
    debugPrint('userAPIService fetchUser() requestToken: $token} \n\n');
    debugPrint(
        'userAPIService fetchUser() responseStatus: ${response.statusCode} \n\n');
    debugPrint(
        'userAPIService fetchUser() responseHeaders: ${response.headers} \n\n');
    debugPrint(
        'userAPIService fetchUser() responseBody: ${response.body} \n\n');

    if (response.statusCode == 200) {
      User user = User.fromJson(jsonDecode(response.body));
      debugPrint("userAPIService fetchUser() user: $user \n\n");

      return user;
    } else {
      throw Exception('userAPIService fetchUser() GET request failed: '
          'Error ${response.statusCode} \n \n');
    }
  }

  //////////////////////////// PUT updateUser ////////////////////////////
  Future<Map<String, dynamic>> updateUserProfile(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _userId = prefs.getString('userId');

    final updateUserURL = Uri.parse(ApiUrl.userLink + _userId.toString());
    var response = await http.put(
      updateUserURL,
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
      body: json.encode({
        'id': userId,
        'designation': designation,
      }),
    );
    debugPrint('userAPIService updateUserProfile() requestToken: $token} \n\n');
    debugPrint(
        'userAPIService updateUserProfile() responseStatus: ${response.statusCode} \n\n');
    debugPrint(
        'userAPIService updateUserProfile() responseHeaders: ${response.headers} \n\n');
    debugPrint(
        'userAPIService updateUserProfile() responseBody: ${response.body} \n\n');

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      debugPrint(
          'userAPIService updateUserProfile() PUT request jsonData: $jsonData \n\n');

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (Route<dynamic> route) => false);

      return jsonData;
    } else {
      throw Exception('userAPIService updateUserProfile() PUT request failed: '
          'Error ${response.statusCode} \n \n');
    }
  }

  ///////////////////////////// GET userLocation /////////////////////////////
  Future<void> fetchCurrentLocation() async {
    debugPrint('Requesting Location Permission... \n\n');
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    } else {
      debugPrint("Permission provided: $permission \n\n");
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      userLat = position.latitude;
      userLon = position.longitude;
      debugPrint('UserApiService fetchCurrentLocation() Lat Lon:  '
          '$userLat , $userLon \n\n');
    }
  }

  //////////////////////////// PUT userSelfie ////////////////////////////
  Future<void> putProfilePic(BuildContext context, File imageFile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _userId = prefs.getString("userId");

    String fileName = imageFile.path.split('/').last;
    var stream = http.ByteStream(imageFile.openRead());
    var length = await imageFile.length();
    Map<String, String> headers = {
      'Authorization': 'Bearer ' + token,
      'Content-Type': 'image/jpeg',
      'Content_Disposition': 'attachment: filename=$fileName'
    };
    var uri =
        Uri.parse(ApiUrl.userLink + _userId.toString() + '/upload_selfie');
    var request = http.MultipartRequest('PUT', uri);
    var multipartFileSign = http.MultipartFile('profile_pic', stream, length,
        filename: basename(imageFile.path));
    request.files.add(multipartFileSign);

    //add headers
    request.headers.addAll(headers);
    var response = await request.send();
    debugPrint(
        'UserApiService putProfilePic() response: ${response.statusCode}');

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      debugPrint('UserApiService putProfilePic() value: $value');
    });
  }
}
