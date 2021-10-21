import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_file/components/custom_suffix_icon.dart';
import 'package:sign_in_file/components/default_button.dart';
import 'package:sign_in_file/components/form_error.dart';
import 'package:sign_in_file/models/user.dart';

import '../../app_localizations.dart';
import '../../constants.dart';
import '../../size_config.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  String userName;
  String email;
  String newPassword;
  String confirmPassword;
  final List<String> nameErrors = [];
  final List<String> emailErrors = [];
  final List<String> passwordErrors = [];
  final List<String> passConfErrors = [];
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
          child: FutureBuilder(
            builder: (BuildContext context,
                AsyncSnapshot<SharedPreferences> snapshot) {
              User user;
              if (snapshot.hasData) {
                var userJson = snapshot.data.getString('user');
                user = User.fromJson(jsonDecode(userJson));
                return Column(children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.05,
                  ),
                  Text(
                    t('login_details'),
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(25),
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.12,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildEmailFormField(t, user.email),
                        FormError(errors: emailErrors),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        buildUserNameFormField(t, user.username),
                        FormError(errors: nameErrors),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        buildPasswordFormField(t),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        buildConfPasswordFormField(t),
                        SizedBox(
                          height: getProportionateScreenHeight(40),
                        ),
                        DefaultButton(
                          text: t('update_details'),
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.07,
                  ),
                ]);
              }
              return Container();
            },
            future: SharedPreferences.getInstance(),
          ),
        ),
      ),
    );
  }

  TextFormField buildConfPasswordFormField(t) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (newPassword == value) {
          setState(() {
            passConfErrors.clear();
          });
        }
        confirmPassword = value;
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: t('confirm') + t('password'),
        hintText: t('re_enter') + t('password'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.lock,
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField(t) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => newPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty || value.length >= 8) {
          setState(() {
            passwordErrors.clear();
          });
        }

        newPassword = value;
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: t('password'),
        hintText: t('enter') + t('password'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.lock,
        ),
      ),
    );
  }

  TextFormField buildEmailFormField(t, String email) {
    return TextFormField(
      autofillHints: ["email"],
      keyboardType: TextInputType.emailAddress,
      initialValue: email,
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
        labelText: t('enter') + t('email'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.mail,
        ),
      ),
    );
  }

  TextFormField buildUserNameFormField(t, String username) {
    return TextFormField(
      keyboardType: TextInputType.text,
      initialValue: username,
      validator: (value) {
        if (value.isEmpty) {
          if (!nameErrors.contains(kNameNullError)) {
            setState(() {
              nameErrors.add(kNameNullError);
            });
          }
          return "";
        }
        return null;
      },
      onSaved: (newValue) => userName = newValue,
      onChanged: (value) {
        nameErrors.clear();
        userName = value;
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: t('enter') + t('userName'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.person,
        ),
      ),
    );
  }
}
