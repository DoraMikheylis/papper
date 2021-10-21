import 'package:flutter/material.dart';
import 'package:sign_in_file/components/default_button.dart';
import 'package:sign_in_file/screens/home/home_screen.dart';
import 'package:sign_in_file/size_config.dart';

import '../../../app_localizations.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image(
          image: AssetImage('assets/images/success.png'),
          height: SizeConfig.screenHeight * 0.4,
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          t('login_success'),
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: t('back_home'),
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
