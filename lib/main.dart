import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_file/app_localizations.dart';
import 'package:sign_in_file/routes.dart';
import 'package:sign_in_file/screens/email_confirmation/email_confirmation_screen.dart';
import 'package:sign_in_file/screens/home/home_screen.dart';
import 'package:sign_in_file/screens/login_success/login_success_screen.dart';
import 'package:sign_in_file/screens/sign_in/sign_in_screen.dart';
import 'package:sign_in_file/theme.dart';

import 'models/nav_item.dart';
// import 'screens/document/document_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return ChangeNotifierProvider(
      create: (context) => NavItems(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('he', 'HE'),
          const Locale('en', ''),
        ],
        initialRoute: EmailConfirmationScreen.routeName,
        routes: routes,
        // home: DocumentListScreen(),
        home: CheckAuth(),
      ),
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = HomeScreen();
    } else {
      child = SignInScreen();
    }
    return Scaffold(
      body: child,
    );
  }
}

extension CustomValidationBuilder on ValidationBuilder {
  notEmpty() => add((value) {
        return value.isEmpty ? 'זהו שדה חובה' : null;
      });
}
