import 'package:flutter/material.dart';
import 'package:sign_in_file/screens/login_details/body.dart';

import '../../app_localizations.dart';

class LoginDetailsScreen extends StatefulWidget {
  static String routeName = '/login_details_screen';

  const LoginDetailsScreen({Key key}) : super(key: key);

  @override
  _LoginDetailsScreenState createState() => _LoginDetailsScreenState();
}

class _LoginDetailsScreenState extends State<LoginDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;
    return Scaffold(
      appBar: AppBar(
        title: Text(t('login_details')),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
