import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_file/components/custom_suffix_icon.dart';
import 'package:sign_in_file/components/default_button.dart';
import 'package:sign_in_file/components/form_error.dart';
import 'package:sign_in_file/network_utils/api.dart';
import 'package:sign_in_file/screens/email_confirmation/email_confirmation_screen.dart';
import 'package:sign_in_file/screens/forgot_password/forgot_password_screen.dart';
import 'package:sign_in_file/screens/login_success/login_success_screen.dart';

import '../../../app_localizations.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  bool loading = false;
  bool passVis = true;
  final List<String> emailErrors = [];
  final List<String> passwordErrors = [];

  @override
  Widget build(BuildContext context) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(t),
          FormError(errors: emailErrors),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildPasswordFormField(t),
          FormError(errors: passwordErrors),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text(t('remember_me')),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  t('forgot_password'),
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          DefaultButton(
            text: loading ? t('loading') : t('sign_in'),
            press: loading
                ? () => {}
                : () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      setState(() {
                        loading = true;
                      });

                      var data = {'username': email, 'password': password};
                      try {
                        var res = await Network().authData(data, '/login');
                        var body = res.data;
                        if (body['token'] != null) {
                          SharedPreferences localStorage =
                              await SharedPreferences.getInstance();
                          localStorage.setString(
                              'token', json.encode(body['token']));
                          localStorage.setString(
                              "user", json.encode(body['user']));
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => LoginSuccessScreen()),
                          );
                        } else {
                          print(body['message']);
                        }
                      } on DioError catch (e) {
                        if (e.response != null) {
                          print("${e.response}");

                          if (e.response?.statusCode == 403) {
                            Navigator.pushNamed(
                              context,
                              EmailConfirmationScreen.routeName,
                            );
                          } else if (e.response?.statusCode == 422) {
                            Map<String, dynamic> errors =
                                e.response?.data['errors'];

                            errors.forEach((key, value) {
                              setState(() {
                                if (key == 'username') {
                                  emailErrors.add(value.first);
                                }
                              });
                            });
                          } else {
                            print(e);
                          }
                        }
                      } finally {
                        setState(() {
                          loading = false;
                        });
                      }
                    }
                  },
          )
        ],
      ),
    );
  }

  TextFormField buildEmailFormField(t) {
    return TextFormField(
      autofillHints: ["email"],
      keyboardType: TextInputType.text,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        setState(() {
          emailErrors.clear();
        });
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          if (!emailErrors.contains(kInvalidEmailError)) {
            setState(() {
              emailErrors.add(kInvalidEmailError);
            });
          }
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: t('email_userName'),
        hintText: (t('enter') + t('email_userName')),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.mail,
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField(t) {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          if (!passwordErrors.contains(kPassNullError)) {
            setState(() {
              passwordErrors.add(kPassNullError);
            });
          }
          return "";
        } else if (value.length < 8) {
          if (!passwordErrors.contains(kShortPassError)) {
            setState(() {
              passwordErrors.add(kShortPassError);
            });
          }
          return "";
        }
        return null;
      },
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        setState(() {
          passwordErrors.clear();
        });
        return null;
      },
      obscureText: passVis,
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: t('password'),
        hintText: t('enter') + t('password'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          icon: Icon(Icons.lock),
          onPressed: () {
            passVis = !passVis;
          },
        ),
      ),
    );
  }
}
