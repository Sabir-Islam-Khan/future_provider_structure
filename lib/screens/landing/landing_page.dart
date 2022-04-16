import 'package:flutter/material.dart';

import '../../services/user_api_service.dart';
import '../../utils/themes.dart';
import '../../screens/splash_page.dart';
import '../../screens/login/login_page.dart';
import '../../screens/registration/registration_page.dart';

late bool isLoading = false;

class LandingPage extends StatelessWidget {
  const LandingPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.height = MediaQuery.of(context).size.height;
    ScreenSize.width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: isLoading == true
            ? splashScreen()
            : SizedBox(
            width: ScreenSize.width,
            child: Column(
              children: [
                SizedBox(
                  height: ScreenSize.height * 0.7,
                  child: logoBox(),
                ),
                SizedBox(
                  height: ScreenSize.height * 0.15,
                  child: registrationButton(context),
                ),
                SizedBox(
                  height: ScreenSize.height * 0.15,
                  child: loginButton(context),
                ),
              ],
            )
        )
    );
  }
  //////////////////////////// Logo Box Widget ////////////////////////////
  Widget logoBox() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: ScreenSize.height * 0.3,
        ),
        SizedBox(
          height: 100,
          width: ScreenSize.width * 1,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(
              "assets/logo/shrink_icon_compressed.png",
            ),
          ),
        ),
      ],
    );
  }
  ///////////////////////// Registration Button Widget /////////////////////////
  Widget registrationButton(context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 60,
            width: 300,
            child: ElevatedButton(
              child: const Text(
                'REGISTER',
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                    return globalColor_2Blue;
                  },
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const RegistrationPage(),
                ));
              },
            ),
          ),
        ]
    );
  }
  //////////////////////////// Login Button Widget ////////////////////////////
  Widget loginButton(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 60,
          width: 300,
          child: ElevatedButton(
            child: Text(
              'LOGIN',
              style: TextStyle(
                  fontSize: 20, color: globalColor_2Blue),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                  return Colors.white;
                },
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                      color: globalColor_2Blue),
                ),
              ),
            ),
            onPressed: () {
              UserApiService().fetchCurrentLocation();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) =>
                  const LoginPage()), (Route<dynamic> route) => false
              );
            },
          ),
        ),
      ],
    );
  }
}