import 'package:flutter/material.dart';
import 'package:sign_in_file/screens/email_confirmation/components/body.dart';

class EmailConfirmationScreen extends StatelessWidget {
  static String routeName = '/email_confirm';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('שכחת את הסיסמא'),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
