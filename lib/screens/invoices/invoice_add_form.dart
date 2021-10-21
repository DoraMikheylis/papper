import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:sign_in_file/components/default_button.dart';
import 'package:sign_in_file/main.dart';
import 'package:sign_in_file/models/document.dart';
import '../../app_localizations.dart';
import '../../size_config.dart';

class AddInvoiceForm extends StatefulWidget {
  static String routeName = "/invoices/add";
  final Document document;

  const AddInvoiceForm({Key key, this.document}) : super(key: key);
  @override
  _AddDocumentFormState createState() => _AddDocumentFormState();
}

class _AddDocumentFormState extends State<AddInvoiceForm> {
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
                      label: "№",
                      validator: ValidationBuilder().notEmpty().build()),
                  buildFormField(
                      label: t("sum"),
                      validator: ValidationBuilder()
                          .notEmpty()
                          .regExp(RegExp(r'\d\.\d'), t("must_be_a_number"))
                          .build()),
                  buildFormField(
                      label: t("VAT"),
                      validator: ValidationBuilder()
                          .notEmpty()
                          .regExp(RegExp(r'\d\.\d'), t("must_be_a_number"))
                          .build()),
                  buildFormField(
                      label: t("creator"),
                      validator: ValidationBuilder().notEmpty().build()),
                  buildFormField(label: t("document_type")),
                  buildFormField(label: t("status")),
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
