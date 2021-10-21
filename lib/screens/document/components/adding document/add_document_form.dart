import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sign_in_file/components/custom_suffix_icon.dart';
import 'package:sign_in_file/components/default_button.dart';
import 'package:sign_in_file/components/form_error.dart';
import 'package:sign_in_file/models/document.dart';

import '../../../../app_localizations.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class AddDocumentForm extends StatefulWidget {
  final Document document;

  const AddDocumentForm({Key key, this.document}) : super(key: key);
  @override
  _AddDocumentFormState createState() => _AddDocumentFormState();
}

class _AddDocumentFormState extends State<AddDocumentForm> {
  final _formKey = GlobalKey<FormState>();
  String userName;
  String email;
  String newPassword;
  String confirmPassword;
  final List<String> nameErrors = [];
  final List<String> emailErrors = [];
  final List<String> passwordErrors = [];
  final List<String> passConfErrors = [];
  Document document;

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
                buildEmailFormField(
                    t, document != null ? document.documentNumber : "",
                    label: "№"),
                FormError(errors: emailErrors),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                buildEmailFormField(
                    t, document != null ? document.sum.toString() : "",
                    label: t("sum")),
                FormError(errors: emailErrors),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                buildEmailFormField(
                    t,
                    widget.document != null
                        ? widget.document.sumWithoutVat.toString()
                        : "",
                    label: t("VAT")),
                FormError(errors: emailErrors),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                buildEmailFormField(
                    t, widget.document != null ? widget.document.creator : "",
                    label: t("creator")),
                FormError(errors: emailErrors),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                buildEmailFormField(t,
                    widget.document != null ? widget.document.documentType : "",
                    label: t("document_type")),
                FormError(errors: emailErrors),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                buildEmailFormField(
                    t, widget.document != null ? widget.document.status : "",
                    label: t("status")),
                FormError(errors: emailErrors),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                OutlinedButton(
                  child: Text("העלאת תמונה"),
                  onPressed: () {
                    getImage();
                  },
                ),
                _image != null ? Image.file(_image) : Container(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
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
        ])),
      ),
    );
  }

  TextFormField buildConfPasswordFormField(t) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (newPassword == value) {
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
      onSaved: (newValue) => newPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty || value.length >= 8) {
          setState(() {
            passwordErrors.clear();
          });
        }

        newPassword = value;
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

  Column buildEmailFormField(t, String email, {String label}) {
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
        initialValue: email,
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
          labelText: "קֶלֶט",
          hintText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      )
    ]);
  }

  TextFormField buildUserNameFormField(t, String username) {
    return TextFormField(
      keyboardType: TextInputType.text,
      initialValue: username,
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
        labelText: t('enter') + t('userName'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.person,
        ),
      ),
    );
  }

  TextFormField buildSumFormField(t, double sum) {
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: sum.toString(),
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
        labelText: t('enter') + t('userName'),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: Icons.person,
        ),
      ),
    );
  }
}
