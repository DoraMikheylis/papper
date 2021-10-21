import 'package:flutter/material.dart';
import 'package:sign_in_file/constants.dart';
import 'package:sign_in_file/screens/sign_up/components/sign_up_form.dart';
import 'package:sign_in_file/size_config.dart';

import '../../../app_localizations.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              Text(
                t('register'),
                style: headingStyle,
              ),
              Text(
                t('complete_details'),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.07,
              ),
              SignUpForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.07,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
