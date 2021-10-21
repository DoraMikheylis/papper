import 'package:flutter/material.dart';
import 'package:sign_in_file/models/document.dart';
import 'package:sign_in_file/screens/document/components/adding%20document/add_document_form.dart';
import 'package:sign_in_file/screens/document/components/adding%20document/edit_document_form.dart';

import '../../../../size_config.dart';

class Body extends StatelessWidget {
  final Document document;

  const Body({Key key, this.document}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                this.document != null
                    ? EditDocumentForm(document: this.document)
                    : AddDocumentForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
