import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sign_in_file/components/custom_suffix_icon.dart';
import 'package:sign_in_file/components/default_button.dart';
import 'package:sign_in_file/components/form_error.dart';
import 'package:sign_in_file/network_utils/api.dart';
import 'package:sign_in_file/screens/sign_in/sign_in_screen.dart';

import '../../../app_localizations.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirmPassword;
  String userName;
  bool tos = false;
  bool loading = false;
  final List<String> emailErrors = [];
  final List<String> passwordErrors = [];
  final List<String> passConfErrors = [];
  final List<String> nameErrors = [];
  @override
  Widget build(BuildContext context) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFullNameFormField(t),
          FormError(errors: nameErrors),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildEmailFormField(t),
          FormError(errors: emailErrors),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPasswordFormField(t),
          FormError(errors: passwordErrors),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildCofPasswordFormField(t),
          FormError(errors: passConfErrors),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Row(
            children: [
              Checkbox(
                value: tos,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    tos = value;
                  });
                },
              ),
              Text(t('tos')),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          DefaultButton(
            text: loading ? t('loading') : t('sign_up'),
            press: loading
                ? null
                : () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      setState(() {
                        loading = true;
                      });

                      var data = {
                        'username': userName,
                        'email': email,
                        'password': password,
                        'password_confirmation': confirmPassword,
                        'tos': tos,
                      };

                      var res = await Network().authData(data, '/register');
                      var body = json.decode(res.body);
                      print(body);
                      if (res.statusCode == 201) {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => SignInScreen()),
                        );
                      } else {
                        Map<String, dynamic> errors = body['errors'];

                        errors.forEach((key, value) {
                          setState(() {
                            if (key == 'email') {
                              emailErrors.add(value.first);
                            } else if (key == 'username') {
                              nameErrors.add(value.first);
                            }
                          });
                        });
                      }
                      setState(() {
                        loading = false;
                      });
                    }
                  },
          ),
        ],
      ),
    );
  }

  TextFormField buildCofPasswordFormField(t) {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (password != value) {
          if (!passConfErrors.contains(kMatchPassError)) {
            setState(() {
              passConfErrors.add(kMatchPassError);
            });
          }
          return "";
        }
        return null;
      },
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (password == value) {
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
        if (value.isNotEmpty || value.length >= 8) {
          setState(() {
            passwordErrors.clear();
          });
        }

        password = value;
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

  TextFormField buildEmailFormField(t) {
    return TextFormField(
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
    );
  }

  TextFormField buildFullNameFormField(t) {
    return TextFormField(
      keyboardType: TextInputType.text,
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
        labelText: t('userName'),
        hintText: t('enter') + t('userName'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.person,
        ),
      ),
    );
  }
}
