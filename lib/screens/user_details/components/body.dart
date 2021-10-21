import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_file/components/custom_suffix_icon.dart';
import 'package:sign_in_file/components/default_button.dart';
import 'package:sign_in_file/components/form_error.dart';
import 'package:sign_in_file/models/user.dart';

import '../../../app_localizations.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:date_field/date_field.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  String firstName;
  String lastName;
  String address;
  String phone;
  DateTime birthDay;
  final List<String> nameErrors = [];
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
                  Image.network(
                    user.avatar,
                    height: SizeConfig.screenHeight * 0.14,
                  ),
                  Text(user.username),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.05,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildFirstNameFormField(t, user.firstName),
                        FormError(errors: nameErrors),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        buildLastNameFormField(t, user.lastName),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        buildAddressFormField(t),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        buildPhoneFormField(t),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        buildDateFormField(t),
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

  TextFormField buildFirstNameFormField(t, String firstname) {
    return TextFormField(
      keyboardType: TextInputType.text,
      initialValue: firstname,
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
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        nameErrors.clear();
        firstName = value;
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: t('first_name'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.person,
        ),
      ),
    );
  }

  TextFormField buildLastNameFormField(t, String lastname) {
    return TextFormField(
      keyboardType: TextInputType.text,
      initialValue: lastname,
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        lastName = value;
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: t('last_name'),
        hintText: t('enter') + t('last_name'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.person,
        ),
      ),
    );
  }

  TextFormField buildAddressFormField(t) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        address = value;
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: t('address'),
        hintText: t('enter') + t('address'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(icon: Icons.home),
      ),
    );
  }

  TextFormField buildPhoneFormField(t) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => phone = newValue,
      onChanged: (value) {
        phone = value;
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: t('phone'),
        hintText: t('enter') + t('phone'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.phone,
        ),
      ),
    );
  }

  DateTimeFormField buildDateFormField(t) {
    return DateTimeFormField(
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        hintText: t('enter') + t('phone'),
        suffixIcon: CustomSuffixIcon(
          icon: Icons.date_range,
        ),
        labelText: t('phone'),
      ),
      mode: DateTimeFieldPickerMode.date,
      autovalidateMode: AutovalidateMode.always,
      onDateSelected: (DateTime value) {
        birthDay = value;
        return null;
      },
      onSaved: (newValue) => birthDay = newValue,
    );
  }
}
