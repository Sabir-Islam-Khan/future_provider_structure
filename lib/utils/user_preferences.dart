import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool("isLoggedIn", true);

    prefs.setString("userId", (user.userId).toString());
    prefs.setString("currencyName", user.currencyName);
    prefs.setString("selfieFile", user.selfieFile);
    prefs.setString("username", user.userName);
    prefs.setString("email", user.email);
    //prefs.setString("token", user.token);
    prefs.setString("designation", user.designation);
    prefs.setString("givenName", user.givenName);
    prefs.setString("lastName", user.lastName);
    prefs.setString("aboutMe", user.aboutMe);
    prefs.setString("languages", user.languages);
    prefs.setString("allergies", user.allergies);
    prefs.setString("preExisting", user.preExisting);
    prefs.setString("countryCode", user.countryCode);
    prefs.setString("phoneNum", user.phoneNum);
    prefs.setString("idType", user.idType);
    prefs.setString("idReg", user.idReg);
    prefs.setString("nationality", user.nationality);
    prefs.setBool("hasCompletedProfile", user.hasCompletedProfile);
    prefs.setBool("hasDeliveryAddress", user.hasDeliveryAddress);
    prefs.setString("lastSeen", user.lastSeen);

    return true;
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.getBool("isLoggedIn");

    int userId = prefs.getInt("userId") as int;
    int currencyId = prefs.getInt("currencyId") as int;
    String currencyName = prefs.getString("currencyName") as String;
    String deviceId = prefs.getString("deviceId") as String;
    String fcmToken = prefs.getString("fcmToken") as String;
    String selfieFile = prefs.getString("selfieFile") as String;
    String userName = prefs.getString("userName") as String;
    String email = prefs.getString("email") as String;
    //String token = prefs.getString("token") as String;
    String designation = prefs.getString("designation") as String;
    String givenName = prefs.getString("givenName") as String;
    String lastName = prefs.getString("lastName") as String;
    String aboutMe = prefs.getString("aboutMe") as String;
    String languages = prefs.getString("languages") as String;
    String allergies = prefs.getString("allergies") as String;
    String preExisting = prefs.getString("preExisting") as String;
    String countryCode = prefs.getString("countryCode") as String;
    String phoneNum = prefs.getString("phoneNum") as String;
    String idType = prefs.getString("idType") as String;
    String idReg = prefs.getString("idReg") as String;
    String nationality = prefs.getString("nationality") as String;
    bool? hasCompletedProfile = prefs.getBool("hasCompletedProfile");
    bool? hasDeliveryAddress = prefs.getBool("hasDeliveryAddress");
    String lastSeen = prefs.getString("lastSeen") as String;

    return User(
      userId: userId,
      currencyId: currencyId,
      currencyName: currencyName,
      deviceId: deviceId,
      fcmToken: fcmToken,
      selfieFile: selfieFile,
      userName: userName,
      email: email,
      //token: token,
      designation: designation,
      givenName: givenName,
      lastName: lastName,
      aboutMe: aboutMe,
      languages: languages,
      allergies: allergies,
      preExisting: preExisting,
      countryCode: countryCode,
      phoneNum: phoneNum,
      idType: idType,
      idReg: idReg,
      nationality: nationality,
      hasCompletedProfile: hasCompletedProfile ?? false,
      hasDeliveryAddress: hasDeliveryAddress ?? false,
      lastSeen: lastSeen,
      links: UserLinks(
        selfLink: '',
        bookingsSentLink: '',
        currencyLink: '',
        ordersLink: '',
        addressesLink: '',
        likedPostsLink: '',
        likedProductsLink: '',
        likedBusinessesLink: '',
        selfieFileLink: '',
        cartLink: '',
        historyLink: '',
        receiptsLink: '',
        medicalCertsLink: '',
      ),
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("userId");
    prefs.remove("currencyName");
    prefs.remove("selfieFile");
    prefs.remove("username");
    prefs.remove("email");
    prefs.remove("token");
    prefs.remove("designation");
    prefs.remove("givenName");
    prefs.remove("lastName");
    prefs.remove("aboutMe");
    prefs.remove("languages");
    prefs.remove("allergies");
    prefs.remove("preExisting");
    prefs.remove("countryCode");
    prefs.remove("phoneNum");
    prefs.remove("idType");
    prefs.remove("idReg");
    prefs.remove("nationality");
    prefs.remove("hasCompletedProfile");
    prefs.remove("hasDeliveryAddress");
    prefs.remove("lastSeen");
  }

  Future<String?> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }
}