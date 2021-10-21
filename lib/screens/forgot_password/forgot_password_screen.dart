import 'package:flutter/material.dart';
import 'package:sign_in_file/screens/forgot_password/components/body.dart';

import '../../app_localizations.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;
    return Scaffold(
      appBar: AppBar(
        title: Text(t('forgot_password')),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
