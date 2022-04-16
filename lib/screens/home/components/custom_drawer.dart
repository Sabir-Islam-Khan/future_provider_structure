import 'package:flutter/material.dart';
import 'package:jaaba/screens/profile/profile_page.dart';
import 'package:jaaba/utils/api_endpoints.dart';
import 'package:jaaba/utils/themes.dart';
import 'package:provider/provider.dart';

import '../../../models/user_model.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    return Drawer(
      backgroundColor: globalColor_20WineRed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: globalColor_16Blue,
                  backgroundImage:
                      NetworkImage(ApiUrl.userSelfieLink + user.selfieFile),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                user.userName.isNotEmpty
                    ? Text(
                        user.userName,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : const Text(
                        "No Name Given",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                const SizedBox(
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 30.0),
                  child: Divider(
                    color: Color.fromRGBO(148, 107, 120, 1),
                  ),
                ),
                user.languages.isNotEmpty
                    ? Text(
                        "Speaks ${user.languages}",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[500],
                        ),
                      )
                    : Text(
                        "No Data Provided",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[500],
                        ),
                      ),
                const Padding(
                  padding: EdgeInsets.only(right: 30.0),
                  child: Divider(
                    color: Color.fromRGBO(148, 107, 120, 1),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
