import 'package:flutter/material.dart';
import 'package:sign_in_file/screens/user_details/components/body.dart';

import '../../app_localizations.dart';

class UserDetailsScreen extends StatefulWidget {
  static String routeName = '/user_details_screen';
  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;
    return Scaffold(
      appBar: AppBar(
        title: Text(t('user_details')),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
