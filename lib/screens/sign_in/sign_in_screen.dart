import 'package:flutter/material.dart';
import 'package:sign_in_file/screens/sign_in/components/body.dart';

import '../../app_localizations.dart';
import '../../size_config.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = '/sign_in';
  @override
  Widget build(BuildContext context) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;

    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t('sign_in')),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
