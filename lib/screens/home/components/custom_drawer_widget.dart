import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/user_model.dart';
import '../../../services/auth_api_service.dart';
import '../../../utils/api_endpoints.dart';
import '../../../utils/themes.dart';
import '../../../screens/home/home_page.dart';
import '../../../screens/user/user_profile_page.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final _userSelfieUrl = ApiUrl.userSelfieLink + user.selfieFile;
    debugPrint('home_screen selfieFileName: $_userSelfieUrl \n\n');

    return Drawer(
      child: Container(
        color: globalColor_20WineRed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///////////////////// userSelfieUrl /////////////////////
                      ClipOval(
                        child: SizedBox(
                          width: 80.0,
                          height: 80.0,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(_userSelfieUrl),
                          ),
                        ),
                      ),

                      /////////////////////// userName ///////////////////////
                      const SizedBox(height: 20),
                      user.userName == null
                          ? Text(
                        user.email,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                          : Text(
                        user.userName,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    height: 1,
                    width: ScreenSize.width * 0.7,
                    color: const Color.fromRGBO(148, 107, 120, 1),
                  ),
                ),

                ///////////////////////// languages /////////////////////////
                Padding(
                  padding: const EdgeInsets.only(
                    right: 24,
                    top: 5,
                    bottom: 5,
                    left: 24,
                  ),
                  child: user.languages != null
                      ? Text(
                    'Speaks ${user.languages}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                      : const Text(
                    'No Language provided',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 1,
                    width: ScreenSize.width * 0.7,
                    color: const Color.fromRGBO(148, 107, 120, 1),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //////////////////////// Profile ////////////////////////
                      TextButton(
                        child: const Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                              UserProfilePage()), (Route<dynamic> route) => false);
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'Delivery Address',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.of(context)
                              .pushNamed("/deliveryAddressPage");
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'Favourites',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.of(context).pushNamed("/favouritesPage");
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'Receipt',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.of(context).pushNamed("/historyPage");
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'Medical Cert',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextButton(
                        child: const Text(
                          'Sign Out',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        onPressed: () {
                          AuthApiService().userLogout(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );



  }
}