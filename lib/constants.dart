import 'package:flutter/material.dart';

import 'size_config.dart';

const kPrimaryColor = Color(0xFF6777EF);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

final headingStyle = TextStyle(
    fontSize: getProportionateScreenWidth(28),
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.5);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "email_null_error";
const String kInvalidEmailError = "invalid_email_error";
const String kPassNullError = "pass_null_error";
const String kShortPassError = "short_pass_error";
const String kMatchPassError = "match_pass_error";
const String kNameNullError = "name_null_error";
