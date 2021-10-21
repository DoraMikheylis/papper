import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_file/models/user.dart';
import 'package:sign_in_file/screens/login_details/login_details_screen.dart';
import 'package:sign_in_file/screens/user_details/user_details_screen.dart';

import '../../../app_localizations.dart';
import '../../../size_config.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;
    return FutureBuilder(
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        User user;
        if (snapshot.hasData) {
          var userJson = snapshot.data.getString('user');
          user = User.fromJson(jsonDecode(userJson));
          return Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Column(
                    children: [
                      Image.network(
                        user.avatar,
                        height: SizeConfig.screenHeight * 0.14,
                      ),
                      Text(user.username),
                    ],
                  ),
                ),
                DrawerListTile(
                  title: t("login_details"),
                  icon: Icon(Icons.person, color: Colors.black),
                  press: () {
                    Navigator.pushNamed(context, LoginDetailsScreen.routeName);
                  },
                ),
                DrawerListTile(
                  title: t("user_details"),
                  icon: Icon(Icons.person, color: Colors.black),
                  press: () {
                    Navigator.pushNamed(context, UserDetailsScreen.routeName);
                  },
                ),
                DrawerListTile(
                  title: t("logout"),
                  icon: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  press: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        }
        return Container();
      },
      future: SharedPreferences.getInstance(),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    // For selecting those three line once press "Command+D"
    this.title,
    this.icon,
    this.press,
  }) : super(key: key);

  final String title;
  final Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
