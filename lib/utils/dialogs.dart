import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'environment_variables.dart';
import '../services/user_api_service.dart';
import '../screens/landing/landing_page.dart';

errorDialog(BuildContext context, String errorMsg) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Error!'),
        content: Text(errorMsg),
        actions: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('Okay'))
            ],
          )
        ],
      )
  );
}

popUpDialog(BuildContext context, String title, String errorMsg) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(errorMsg),
        actions: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('Okay'))
            ],
          )
        ],
      )
  );
}

registrationEmailExistDialog(BuildContext context) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Email'),
        content: const Text('Email already used for registration'),
        actions: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('Okay'))
            ],
          )
        ],
      )
  );
}

registerDialog(BuildContext context) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Invalid Email and/or Password'),
        content: const Text('Do you want to register?'),
        actions: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LandingPage(),
                          ),
                        ),
                        child: const Text('No')),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/registerUser')
                                .then((result) {
                              Navigator.of(context).pop();
                            }),
                        child: const Text('Yes')),
                  ),
                ],
              )
            ],
          )
        ],
      )
  );
}

loadingDialog(BuildContext context, String title, String errorMsg) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(errorMsg),
      )
  );
}

updatingDialog(
    BuildContext context,
    String title,
    String body,
    ) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed("/homePage"),
              child: const Text('Okay'),
            )
          ],
        )
      ],
    ),
  );
}

sessionExpiredDialog(BuildContext context) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Session Expired!'),
        content: const Text('Your session has expired, please login again.'),
        actions: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    resetButton();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LandingPage(),
                      ),
                    );
                  },
                  child: const Text('Okay'))
            ],
          )
        ],
      )
  );
}

final RoundedLoadingButtonController _btnController =
RoundedLoadingButtonController();

void _doSomething(RoundedLoadingButtonController controller) async {
  Timer(const Duration(seconds: 2), () {
    controller.success();
  });
}

imageDialog(BuildContext context, File file) async {
  File rotatedImage = await FlutterExifRotation.rotateImage(path: file.path);
  showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(10),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
                height: 200,
                padding: const EdgeInsets.fromLTRB(60, 50, 60, 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'How does this look?',
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 50,
                        width: 160,
                        child: RoundedLoadingButton(
                          child: const Text(
                            'Good !',
                            style: TextStyle(color: Colors.white),
                          ),
                          controller: _btnController,
                          onPressed: () {
                            _doSomething(_btnController);
                            UserApiService().putProfilePic(
                              context,
                              rotatedImage,
                            );
                          },
                        ))
                  ],
                )),
            Positioned(
              top: -100,
              child: ClipOval(
                child: Image.file(
                  file,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      )
  );
}

resetButton() {
  token = '';
  userId = 0;
  givenName = '';
  lastName = '';
  phoneNum = '';

  cartLink = '';
  ordersLink = '';
  receiptsLink = '';
  selfLink = '';

  //numProducts = 0;
  sessionID = '';
  publicKey = '';
  cartID = 0;
}