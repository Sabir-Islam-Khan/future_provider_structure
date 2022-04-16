import 'package:flutter/material.dart';
import 'package:jaaba/screens/company/components/bottom_nav_bar.dart';

import '../../../models/company_model.dart';

class CompanyScaffoldWidget extends StatelessWidget {
  final Company company;
  final Widget children;
  const CompanyScaffoldWidget({
    Key? key,
    required this.children,
    required this.company,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Transform.scale(
            scale: 0.7,
            child: ClipOval(
              child: Container(
                height: 20.0,
                width: 20.0,
                color: Colors.grey[200],
                child: InkWell(
                  splashColor: Colors.red[200],
                  child: const SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
        ),
        body: children,
        bottomNavigationBar: customBottomNavBar(
          company,
          context,
        ));
  }
}
