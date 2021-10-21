import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:sign_in_file/components/default_button.dart';
import 'package:sign_in_file/main.dart';
import '../../app_localizations.dart';
import '../../size_config.dart';

class ClientAddForm extends StatefulWidget {
  static String routeName = "/clients/add";

  const ClientAddForm({Key key}) : super(key: key);
  @override
  _AddDocumentFormState createState() => _AddDocumentFormState();
}

class _AddDocumentFormState extends State<ClientAddForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ValidationBuilder.setLocale("en");

    final String Function(String key) t =
        AppLocalizations.of(context).translate;

    return Scaffold(
      appBar: AppBar(title: Text("ליצור חשבונית")),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
              child: Column(children: [
            SizedBox(height: 250),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  buildFormField(
                      label: t("email"),
                      validator: ValidationBuilder()
                          .notEmpty()
                          .email(t("invalid_email_error"))
                          .build()),
                  DefaultButton(
                    text: t('confirm'),
                    press: () {
                      if (_formKey.currentState.validate()) {
                        print("valid");
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.07,
            ),
          ])),
        ),
      ),
    );
  }

  Column buildFormField(
      {String val, String label, String Function(String) validator}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Text(
          label ?? "Document number",
          textAlign: TextAlign.start,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      SizedBox(height: 10),
      TextFormField(
        keyboardType: TextInputType.text,
        validator: validator,
        decoration: InputDecoration(
          labelText: "קֶלֶט",
          hintText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
      SizedBox(
        height: getProportionateScreenHeight(20),
      ),
    ]);
  }
}
