import 'package:flutter/material.dart';
import 'package:sign_in_file/app_localizations.dart';
import 'package:sign_in_file/components/bottom_nav_bar.dart';
import 'package:sign_in_file/screens/home/components/body.dart';
import 'package:sign_in_file/screens/home/components/side_menu.dart';

import '../../size_config.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: SideMenu(),
      appBar: buildAppBar(context),
      body: Body(),
      // We are not able to BottomNavigationBar because the icon parameter dont except SVG
      // We also use Provied to manage the state of our Nav
      bottomNavigationBar: BottomNavBar(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(AppLocalizations.of(context).translate("home_page")),
    );
  }
}
