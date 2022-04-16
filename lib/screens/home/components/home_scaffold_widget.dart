import 'package:flutter/material.dart';

import '../../../services/auth_api_service.dart';
import '../../../utils/themes.dart';
import 'app_bar_widget.dart';
import 'custom_drawer_widget.dart';

class HomeScaffoldWidget  extends StatelessWidget {
  final List<Widget> children;
  const HomeScaffoldWidget({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.height = MediaQuery.of(context).size.height;
    ScreenSize.width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const CustomDrawerWidget(),
      //drawer: CustomDrawerWidget(),
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
              flexibleSpace: const AppBarWidget(),
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

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          AuthApiService().userLogout(context);
        },
        label: const Text('LOGOUT'),
        icon: const Icon(Icons.logout),
        backgroundColor: Colors.pink,
      ),
    );
  }
}