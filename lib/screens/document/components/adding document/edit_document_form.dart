import 'package:flutter/material.dart';
import 'package:sign_in_file/components/custom_suffix_icon.dart';
import 'package:sign_in_file/components/default_button.dart';
import 'package:sign_in_file/components/form_error.dart';
import 'package:sign_in_file/models/document.dart';

import '../../../../app_localizations.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class EditDocumentForm extends StatefulWidget {
  final Document document;

  const EditDocumentForm({Key key, this.document}) : super(key: key);
  @override
  _AddDocumentFormState createState() => _AddDocumentFormState();
}

class _AddDocumentFormState extends State<EditDocumentForm> {
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
            child: Column(children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                buildFormField(
                    val: widget.document != null
                        ? widget.document.documentNumber
                        : "",
                    label: "№"),
                buildFormField(
                    val: widget.document != null
                        ? widget.document.sum.toString()
                        : "",
                    label: t("sum")),
                buildFormField(
                    val: widget.document != null
                        ? widget.document.sumWithoutVat.toString()
                        : "",
                    label: t("VAT")),
                buildFormField(
                    val: widget.document != null ? widget.document.creator : "",
                    label: t("creator")),
                buildFormField(
                    val: widget.document != null
                        ? widget.document.documentType
                        : "",
                    label: t("document_type")),
                buildFormField(
                    val: widget.document != null ? widget.document.status : "",
                    label: t("status")),
                buildFormField(
                    val: widget.document != null
                        ? widget.document.vat.toString()
                        : ""),
                buildFormField(
                    val: widget.document != null
                        ? widget.document.currencySign
                        : ""),
                buildFormField(
                    val: widget.document != null
                        ? widget.document.documentNumber
                        : ""),
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
        ])),
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
