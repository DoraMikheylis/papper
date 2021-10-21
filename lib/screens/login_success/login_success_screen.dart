import 'package:flutter/material.dart';
import 'package:sign_in_file/screens/login_success/components/body.dart';

import '../../app_localizations.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = '/login_success';
  @override
  Widget build(BuildContext context) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;
    return Scaffold(
      appBar: AppBar(
        title: Text(t('login_success')),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
