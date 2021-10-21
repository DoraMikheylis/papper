import 'package:flutter/material.dart';
import 'package:sign_in_file/components/custom_suffix_icon.dart';
import 'package:sign_in_file/components/default_button.dart';
import 'package:sign_in_file/components/form_error.dart';
import 'package:sign_in_file/components/no_account_text.dart';
import 'package:sign_in_file/size_config.dart';

import '../../../app_localizations.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                t('forgot_password'),
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              Text(
                t('forgot_password_text'),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> emailErrors = [];
  String email;
  @override
  Widget build(BuildContext context) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autofillHints: ["email"],
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              setState(() {
                emailErrors.clear();
              });
              return null;
            },
            validator: (value) {
              if (value.isEmpty) {
                if (!emailErrors.contains(kEmailNullError)) {
                  setState(() {
                    emailErrors.add(kEmailNullError);
                  });
                }
                return '';
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                if (!emailErrors.contains(kInvalidEmailError)) {
                  setState(() {
                    emailErrors.add(kInvalidEmailError);
                  });
                }
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              errorStyle: TextStyle(height: 0),
              labelText: t('email'),
              hintText: t('enter') + t('email'),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcon(
                icon: Icons.mail,
              ),
            ),
          ),
          FormError(errors: emailErrors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: t('continue'),
            press: () {
              if (_formKey.currentState.validate()) {
                // отправка email на почту
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
        ],
      ),
    );
  }
}
