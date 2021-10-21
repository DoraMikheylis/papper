import 'package:flutter/material.dart';
import 'package:sign_in_file/screens/sign_up/components/body.dart';

import '../../app_localizations.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = '/sign_up';
  @override
  Widget build(BuildContext context) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;
    return Scaffold(
      appBar: AppBar(
        title: Text(t('sign_up')),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
