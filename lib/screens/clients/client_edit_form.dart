import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:sign_in_file/components/default_button.dart';
import 'package:sign_in_file/main.dart';
import 'package:sign_in_file/models/client.dart';
import '../../app_localizations.dart';
import '../../size_config.dart';

class ClientEditForm extends StatefulWidget {
  static String routeName = "/clients/edit";
  final Client client;

  const ClientEditForm({Key key, this.client}) : super(key: key);
  @override
  _AddDocumentFormState createState() => _AddDocumentFormState();
}

class _AddDocumentFormState extends State<ClientEditForm> {
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  buildFormField(
                      label: t("email"),
                      val: widget.client.email,
                      validator: ValidationBuilder()
                          .notEmpty()
                          .email(t("invalid_email_error"))
                          .build()),
                  buildFormField(
                      label: t("first_name"),
                      val: widget.client.firstName,
                      validator: ValidationBuilder().notEmpty().build()),
                  buildFormField(
                      label: t("last_name"),
                      val: widget.client.lastName,
                      validator: ValidationBuilder().notEmpty().build()),
                  buildFormField(
                      label: t("address"),
                      val: widget.client.address,
                      validator: ValidationBuilder().notEmpty().build()),
                  buildFormField(
                      label: t("phone"),
                      val: widget.client.phone,
                      validator: ValidationBuilder()
                          .notEmpty()
                          .phone(t("invalid_phone"))
                          .build()),
                  buildFormField(
                      label: t("VAT"),
                      val: widget.client.vatNumber,
                      validator: ValidationBuilder()
                          .regExp(RegExp(r'\d*'), t("must_be_a_number"))
                          .notEmpty()
                          .build()),
                  DefaultButton(
                    text: t('update_details'),
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
        initialValue: val,
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
