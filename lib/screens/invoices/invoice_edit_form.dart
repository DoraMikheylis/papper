import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:sign_in_file/components/default_button.dart';
import 'package:sign_in_file/main.dart';
import 'package:sign_in_file/models/invoice.dart';
import '../../app_localizations.dart';
import '../../size_config.dart';

class EditInvoiceForm extends StatefulWidget {
  static String routeName = "/invoices/edit";
  final Invoice invoice;

  const EditInvoiceForm({Key key, this.invoice}) : super(key: key);
  @override
  _AddDocumentFormState createState() => _AddDocumentFormState();
}

class _AddDocumentFormState extends State<EditInvoiceForm> {
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
                      val: widget.invoice.invoiceNumber,
                      validator: ValidationBuilder().notEmpty().build()),
                  buildFormField(
                      label: t("sum"),
                      val: widget.invoice.total.toString(),
                      validator: ValidationBuilder()
                          .notEmpty()
                          .regExp(RegExp(r'\d\.\d'), t("must_be_a_number"))
                          .build()),
                  buildFormField(
                      label: t("VAT"),
                      val: widget.invoice.vatSum.toString(),
                      validator: ValidationBuilder()
                          .notEmpty()
                          .regExp(RegExp(r'\d\.\d'), t("must_be_a_number"))
                          .build()),
                  buildFormField(
                      label: t("creator"),
                      val: widget.invoice.creator.username,
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
