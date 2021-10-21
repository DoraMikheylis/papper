import 'package:flutter/material.dart';
import 'package:sign_in_file/screens/clients/client_add_form.dart';
import 'package:sign_in_file/screens/clients/clients_list.dart';
import 'package:sign_in_file/screens/document/document_list_screen.dart';
import 'package:sign_in_file/screens/email_confirmation/email_confirmation_screen.dart';
import 'package:sign_in_file/screens/forgot_password/forgot_password_screen.dart';
import 'package:sign_in_file/screens/home/home_screen.dart';
import 'package:sign_in_file/screens/invoices/invoice_add_form.dart';
import 'package:sign_in_file/screens/invoices/invoice_edit_form.dart';
import 'package:sign_in_file/screens/login_details/login_details_screen.dart';
import 'package:sign_in_file/screens/invoices/invoices_list_screen.dart';
import 'package:sign_in_file/screens/login_success/login_success_screen.dart';
import 'package:sign_in_file/screens/sign_in/sign_in_screen.dart';
import 'package:sign_in_file/screens/sign_up/sign_up_screen.dart';
import 'package:sign_in_file/screens/document/add_document.dart';
import 'package:sign_in_file/screens/user_details/user_details_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DocumentListScreen.routeName: (context) => DocumentListScreen(),
  InvoiceListScreen.routeName: (context) => InvoiceListScreen(),
  EmailConfirmationScreen.routeName: (context) => EmailConfirmationScreen(),
  AddDocumentScreen.routeName: (context) => AddDocumentScreen(),
  UserDetailsScreen.routeName: (context) => UserDetailsScreen(),
  LoginDetailsScreen.routeName: (context) => LoginDetailsScreen(),
  ClientsListScreen.routeName: (context) => ClientsListScreen(),
  AddInvoiceForm.routeName: (context) => AddInvoiceForm(),
  EditInvoiceForm.routeName: (context) => EditInvoiceForm(),
  ClientAddForm.routeName: (context) => ClientAddForm()
};
