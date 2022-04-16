import 'package:flutter/material.dart';

import '../../../services/auth_api_service.dart';
import '../../../utils/themes.dart';
import '../../home/components/app_bar.dart';
import '../../home/components/custom_drawer.dart';

class HealthBlogScaffoldWidget extends StatelessWidget {
  final List<Widget> children;
  const HealthBlogScaffoldWidget({Key? key, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: mainBlue,
              pinned: false,
              floating: true,
              leading: const SizedBox(),
              forceElevated: innerBoxIsScrolled,
              flexibleSpace: customAppBar("asd"),
            )
          ];
        },
        body: SingleChildScrollView(
          child: MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            child: Column(
              children: <Widget>[
                Column(
                  children: children,
                ),
              ],
            ),
          ),
        ),
      ),

      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     AuthApiService().userLogout(context);
      //   },
      //   label: const Text('LOGOUT'),
      //   icon: const Icon(Icons.logout),
      //   backgroundColor: Colors.pink,
      // ),
    );
  }
}
