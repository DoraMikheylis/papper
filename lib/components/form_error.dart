import 'package:flutter/material.dart';

import '../app_localizations.dart';
import '../size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;
    return Column(
      children: List.generate(
        errors.length,
        (index) => formErrorText(error: t(errors[index])),
      ),
    );
  }

  Padding formErrorText({String error}) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Icon(
            Icons.error,
            size: getProportionateScreenWidth(14),
          ),
          SizedBox(width: getProportionateScreenWidth(10)),
          Text(error),
        ],
      ),
    );
  }
}
